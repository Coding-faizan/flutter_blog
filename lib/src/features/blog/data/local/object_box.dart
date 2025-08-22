import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../../../objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<ArticleEntity> articleBox;

  ObjectBox._create(this.store) {
    articleBox = store.box();
  }

  static Future<ObjectBox> initObx() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-blog"));
    return ObjectBox._create(store);
  }

  Future<List<int>> putArticles(List<ArticleEntity> articles) async {
    return articleBox.putManyAsync(articles);
  }

  Future<List<ArticleEntity>> getAllArticles() async {
    return articleBox.getAllAsync();
  }

  Future<ArticleEntity?> getArticle(int id) async {
    return await articleBox.getAsync(id);
  }

  Future<int> putArticle(ArticleEntity articleEntity) async {
    return articleBox.putAsync(articleEntity);
  }

  Future<void> clearArticles() async {
    articleBox.removeAllAsync();
  }

  void close() {
    store.close();
  }
}
