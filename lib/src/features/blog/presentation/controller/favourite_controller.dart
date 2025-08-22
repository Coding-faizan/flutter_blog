import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteController extends Notifier<void> {
  @override
  void build() {}

  Future<void> toggleFav(int id) async {
    await ref.read(articleRepositoryProvider).toggleFav(id);
    ref.invalidate(articlesListProvider);
  }
}

final favouriteControllerProvider = NotifierProvider(
  () => FavouriteController(),
);
