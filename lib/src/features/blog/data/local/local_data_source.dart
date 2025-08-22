import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:flutter_blog/src/features/blog/data/local/object_box.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDataSource {
  final ObjectBox objectBox;

  LocalDataSource({required this.objectBox});

  Future<void> saveArticles(List<Article> articles) async {
    final articleEntities = articles.map((a) => a.toArticleEntity()).toList();
    objectBox.putArticles(articleEntities);
  }

  Future<List<Article>> getArticles() async {
    final articleEntities = await objectBox.getAllArticles();

    final articles = articleEntities.map((a) => a.toArticle()).toList();
    return articles;
  }

  Future<Article?> getArticle(int id) async {
    final article = await objectBox.getArticle(id);
    return article?.toArticle();
  }

  Future<int> putArticle(Article article) async {
    return objectBox.putArticle(article.toArticleEntity());
  }

  void clearArticles() {
    objectBox.clearArticles();
  }
}

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  throw UnimplementedError('localDataSourceProvider not implemented');
});
