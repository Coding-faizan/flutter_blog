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

  List<int> putArticles(List<ArticleEntity> articles) {
    return articleBox.putMany(articles);
  }

  List<ArticleEntity> getAllArticles() {
    return articleBox.getAll();
  }

  void clearArticles() {
    articleBox.removeAll();
  }

  void close() {
    store.close();
  }
}
