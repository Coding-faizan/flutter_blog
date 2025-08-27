import 'package:flutter_blog/objectbox.g.dart';
import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDataSource {
  final Box<ArticleEntity> _articleBox;

  LocalDataSource(Store store) : _articleBox = store.box();

  void saveArticles(List<ArticleEntity> articles) {
    for (var a in articles) {
      if (_getArticleByTitle(a.title)?.title == a.title) {
        continue;
      }
      _articleBox.put(a);
    }
  }

  List<ArticleEntity> getArticles() => _articleBox.getAll();

  ArticleEntity? getArticle(int id) {
    final article = _articleBox.get(id);
    return article;
  }

  ArticleEntity? _getArticleByTitle(String id) {
    final query = _articleBox.query(ArticleEntity_.title.equals(id)).build();
    final article = query.findFirst();
    return article;
  }

  void putArticle(ArticleEntity article) => _articleBox.put(article);

  void removeArticles() {
    final articles = getArticles();
    for (final a in articles) {
      if (a.isFav || a.isWatched) {
        continue;
      }
      _articleBox.remove(a.id);
    }
  }

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
