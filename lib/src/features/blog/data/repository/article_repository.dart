import 'dart:convert';
import 'package:flutter_blog/src/features/blog/data/remote/article_dto.dart';
import 'package:flutter_blog/src/features/blog/data/remote/remote_data_source.dart';
import 'package:flutter_blog/src/features/blog/data/local/local_data_source.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ArticleRepository({
    required RemoteDataSource blogRemoteDataSource,
    required LocalDataSource localDataSource,
  }) : _remoteDataSource = blogRemoteDataSource,
       _localDataSource = localDataSource;

  Future<List<Article>> getArticles({bool isPullToRefresh = false}) async {
    var localArticles = _localDataSource.getArticles();
    if (localArticles.isNotEmpty && !isPullToRefresh) {
      return localArticles;
    }

    _localDataSource.removeArticles();

    final responseBody = await _remoteDataSource.fetchBlogs();
    // Json -> DTO
    final decodedJson = jsonDecode(responseBody);
    final List<dynamic> data = decodedJson['articles'];
    final articleDtos = data.map((json) => ArticleDto.fromJson(json));

    //Dto -> Domain
    var articles = articleDtos.map((dto) => dto.toArticle()).toList();

    //saving locally
    _localDataSource.saveArticles(articles);
    return _localDataSource.getArticles();
  }

  void toggleFav(int id) {
    _localDataSource.toogleFav(id);
  }

  void markWatched(int id) {
    _localDataSource.markWatched(id);
  }

  void removeArticles() {
    _localDataSource.removeArticles();
  }
}

final articleRepositoryProvider = Provider((ref) {
  final LocalDataSource localDataSource = ref.read(localDataSourceProvider);
  final RemoteDataSource remoteDataSource = ref.read(remoteDataSourceProvider);
  final ArticleRepository articleRepository = ArticleRepository(
    blogRemoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
  return articleRepository;
});
