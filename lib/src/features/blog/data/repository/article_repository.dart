import 'dart:convert';

import 'package:flutter_blog/src/features/blog/data/remote/article_dto.dart';
import 'package:flutter_blog/src/features/blog/data/remote/remote_data_source.dart';
import 'package:flutter_blog/src/features/blog/data/local/local_data_source.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
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
    final localArticles = await _localDataSource.getArticles();

    if (localArticles.isNotEmpty) {
      return localArticles;
    }

    final responseBody = await _remoteDataSource.fetchBlogs();
    // Json -> DTO
    final decodedJson = jsonDecode(responseBody);
    final List<dynamic> data = decodedJson['articles'];
    final articleDtos = data.map((json) => ArticleDto.fromJson(json));

    //Dto -> Domain
    final articles = articleDtos.map((dto) => dto.toArticle()).toList();

    //saving locally
    await _localDataSource.saveArticles(articles);
    return _localDataSource.getArticles();
  }

  Future<void> toggleFav(int articleId) async {
    var article = await _localDataSource.getArticle(articleId);
    if (article != null) {
      article.isFav = !article.isFav;
      await _localDataSource.putArticle(article);
    }
  }

  Future<void> markWatched(int articleId) async {
    var article = await _localDataSource.getArticle(articleId);
    if (article != null) {
      article.isWatched = !article.isWatched;
      await _localDataSource.putArticle(article);
    }
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

final articlesListProvider = FutureProvider((ref) {
  final ArticleRepository articleRepository = ref.watch(
    articleRepositoryProvider,
  );
  return articleRepository.getArticles();
});

final articlesSourcesProvider = Provider((ref) {
  final articles = ref.read(articlesListProvider).asData?.value ?? [];
  final sources = articles.map((a) => a.source).toSet().toList();
  return sources;
});

final filteredArticlesProvider = Provider((ref) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final selectedSources = ref.watch(sourcesControllerProvider);

  final filteredArticles = articles
      .where((a) => selectedSources.contains(a.source))
      .toList();

  return filteredArticles.isEmpty ? articles : filteredArticles;
});

final articleProvider = Provider.autoDispose.family<Article, int>((ref, id) {
  final articleRepository = ref.watch(articleRepositoryProvider);
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final article = articles.firstWhere((a) => a.id == id);
  ref.onDispose(() {
    if (!article.isWatched) {
      articleRepository.markWatched(id);
      ref.invalidate(articlesListProvider);
    }
  });

  return article;
});

final favArticlesProvider = Provider((ref) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final favArticles = articles.where((a) => a.isFav).toList();
  return favArticles;
});

final watchedArticlesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articlesListProvider).asData?.value ?? [];
  final watchedArticles = articles.where((a) => a.isWatched).toList();
  return watchedArticles;
});
