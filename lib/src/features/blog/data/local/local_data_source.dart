import 'package:flutter_blog/objectbox.g.dart';
import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDataSource {
  final Box<ArticleEntity> _articleBox;

  LocalDataSource(Store store) : _articleBox = store.box();

  void saveArticles(List<ArticleEntity> articles) =>
      _articleBox.putMany(articles);

  List<ArticleEntity> getArticles() => _articleBox.getAll();

  ArticleEntity? getArticle(int id) {
    final article = _articleBox.get(id);
    return article;
  }

  void putArticle(ArticleEntity article) => _articleBox.put(article);

  void removeArticles() => _articleBox.removeAll();

  void toogleFav(int id) {
    final article = getArticle(id);
    article?.isFav = !article.isFav;
    putArticle(article!);
  }

  void markWatched(int id) {
    final article = getArticle(id);
    article?.isWatched = !article.isWatched;
    putArticle(article!);
  }
}

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  throw UnimplementedError('localDataSourceProvider not implemented');
});
