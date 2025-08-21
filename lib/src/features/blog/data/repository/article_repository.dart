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
    final localArticles = _localDataSource.getArticles();

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
    _localDataSource.saveArticles(articles);
    return _localDataSource.getArticles();
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
  final articles = ref.read(articlesListProvider).asData?.value ?? [];
  final selectedSources = ref.watch(sourcesControllerProvider);

  final filteredArticles = articles
      .where((a) => selectedSources.contains(a.source))
      .toList();

  return filteredArticles.isEmpty ? articles : filteredArticles;
});

final articleProvider = Provider.autoDispose.family((ref, id) {
  final articles = ref.read(articlesListProvider).asData?.value ?? [];
  final article = articles.firstWhere((a) => a.id == id);
  return article;
});
