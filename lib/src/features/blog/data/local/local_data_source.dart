import 'package:flutter_blog/objectbox.g.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDataSource {
  final Box<Article> _articleBox;

  LocalDataSource(Store store) : _articleBox = store.box();

  void saveArticles(List<Article> articles) {
    // If the article is in cache but not in API
    final articlesFromLocal = _articleBox.getAll();
    final articleTitles = articles.map((a) => a.title);
    for (final article in articlesFromLocal) {
      if (!articleTitles.contains(article.title)) {
        _articleBox.remove(article.id);
      }
    }

    // If article is in cache then skip else write
    for (var a in articles) {
      final articleGotByTitle = _getArticleByTitle(a.title);

      if (articleGotByTitle?.title == a.title) {
        continue;
      }
      _articleBox.put(a);
    }
  }

  List<Article> getArticles() => _articleBox.getAll();

  Article? getArticle(int id) {
    final article = _articleBox.get(id);
    return article;
  }

  Article? _getArticleByTitle(String id) {
    final query = _articleBox.query(Article_.title.equals(id)).build();
    final article = query.findFirst();
    return article;
  }

  void putArticle(Article article) => _articleBox.put(article);

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
