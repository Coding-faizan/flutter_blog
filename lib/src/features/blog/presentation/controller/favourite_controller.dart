import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/articles_list_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteController extends Notifier<void> {
  @override
  void build() {}

  void toggleFav(int id) {
    ref.read(articleRepositoryProvider).toggleFav(id);
    ref.invalidate(articleListControllerProvider);
  }
}

final favouriteControllerProvider = NotifierProvider(
  () => FavouriteController(),
);
