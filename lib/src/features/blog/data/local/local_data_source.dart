import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:flutter_blog/src/features/blog/data/local/object_box.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDataSource {
  final ObjectBox objectBox;

  LocalDataSource({required this.objectBox});

  void saveArticles(List<Article> articles) {
    final articleEntities = articles.map((a) => a.toArticleEntity()).toList();
    objectBox.putArticles(articleEntities);
  }

  List<Article> getArticles() {
    final articleEntities = objectBox.getAllArticles();

    final articles = articleEntities.map((a) => a.toArticle()).toList();
    return articles;
  }

  void clearArticles() {
    objectBox.clearArticles();
  }
}

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  throw UnimplementedError('localDataSourceProvider not implemented');
});
