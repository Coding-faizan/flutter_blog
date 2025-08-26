import 'dart:convert';
import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:flutter_blog/src/features/blog/data/remote/article_dto.dart';
import 'package:flutter_blog/src/features/blog/data/remote/remote_data_source.dart';
import 'package:flutter_blog/src/features/blog/data/local/local_data_source.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/searchsearch_state_provider.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/sources_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ArticleRepository({
    required RemoteDataSource blogRemoteDataSource,
    required LocalDataSource localDataSource,
  }) : _remoteDataSource = blogRemoteDataSource,
       _localDataSource = localDataSource;

  Future<List<Article>> getArticles() async {
    var localArticleEntities = await _localDataSource.getArticles();
    if (localArticleEntities.isNotEmpty) {
      return localArticleEntities.map((e) => e.toArticle()).toList();
    }

    final responseBody = await _remoteDataSource.fetchBlogs();
    // Json -> DTO
    final decodedJson = jsonDecode(responseBody);
    final List<dynamic> data = decodedJson['articles'];
    final articleDtos = data.map((json) => ArticleDto.fromJson(json));

    //Dto -> Domain
    var articles = articleDtos.map((dto) => dto.toArticle()).toList();

    //Domain -> Entity
    final articleEntities = articles.map((a) => a.toArticleEntity()).toList();
    //saving locally
    await _localDataSource.saveArticles(articleEntities);
    localArticleEntities = await _localDataSource.getArticles();
    articles = localArticleEntities.map((e) => e.toArticle()).toList();
    return articles;
  }

  Future<void> toggleFav(int id) async {
    await _localDataSource.toogleFav(id);
  }

  Future<void> markWatched(int id) async {
    await _localDataSource.markWatched(id);
  }

  Future<void> removeArticles() async {
    await _localDataSource.removeArticles();
  }
}

final articleRepositoryProvider = Provider((ref) {
  final LocalDataSource localDataSource = ref.watch(localDataSourceProvider);
  final RemoteDataSource remoteDataSource = ref.watch(remoteDataSourceProvider);
  final ArticleRepository articleRepository = ArticleRepository(
    blogRemoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
  return articleRepository;
});

final articlesListProvider = FutureProvider.autoDispose((ref) {
  final ArticleRepository articleRepository = ref.watch(
    articleRepositoryProvider,
  );
  ref.keepAlive();
  return articleRepository.getArticles();
});

final articlesSourcesProvider = Provider((ref) {
  final articles = ref.read(articlesListProvider).asData?.value ?? [];
  final sources = articles.map((a) => a.source).toSet().toList();
  return sources;
});

final articlesFilteredBySourcesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final selectedSources = ref.watch(sourcesControllerProvider);
  final filteredArticles = articles
      .where((a) => selectedSources.contains(a.source))
      .toList();

  return filteredArticles.isEmpty ? articles : filteredArticles;
});

final articlesFilteredBySearchProvider = Provider.autoDispose((ref) {
  final articlesFilteredBySources = ref.watch(
    articlesFilteredBySourcesProvider,
  );
  final searchQuery = ref.watch(articlesSearchTextProvider).toLowerCase();

  final articlesFilteredBySearch = articlesFilteredBySources
      .where(
        (a) =>
            a.title.toLowerCase().contains(searchQuery) ||
            a.description.toLowerCase().contains(searchQuery) ||
            a.source.toLowerCase().contains(searchQuery),
      )
      .toList();

  return articlesFilteredBySearch;
});

final articleProvider = Provider.autoDispose.family<Article, int>((ref, id) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final article = articles.firstWhere((a) => a.id == id);
  ref.onDispose(() async {
    if (!article.isWatched) {
      await ref.read(articleRepositoryProvider).markWatched(id);
      ref.invalidate(articlesListProvider);
    }
  });

  return article;
});

final favArticlesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final favArticles = articles.where((a) => a.isFav).toList();
  return favArticles;
});

final watchedArticlesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final watchedArticles = articles.where((a) => a.isWatched).toList();

  return watchedArticles;
});
