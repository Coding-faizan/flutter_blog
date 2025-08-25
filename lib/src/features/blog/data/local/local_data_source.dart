import 'package:flutter_blog/objectbox.g.dart';
import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDataSource {
  final Box<ArticleEntity> _articleBox;

  LocalDataSource(Store store) : _articleBox = store.box();

  Future<void> saveArticles(List<ArticleEntity> articles) async {
    await _articleBox.putManyAsync(articles);
  }

  Future<List<ArticleEntity>> getArticles() async {
    return await _articleBox.getAllAsync();
  }

  Future<ArticleEntity?> getArticle(int id) async {
    final article = await _articleBox.getAsync(id);
    return article;
  }

  Future<void> putArticle(ArticleEntity article) async {
    _articleBox.putAsync(article);
  }

  Future<void> removeArticles() async {
    _articleBox.removeAllAsync();
  }

  Future<void> toogleFav(int id) async {
    final article = await getArticle(id);
    article?.isFav = !article.isFav;
    await putArticle(article!);
  }

  Future<void> markWatched(int id) async {
    final article = await getArticle(id);
    article?.isWatched = !article.isWatched;
    putArticle(article!);
  }
}

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  throw UnimplementedError('localDataSourceProvider not implemented');
});
