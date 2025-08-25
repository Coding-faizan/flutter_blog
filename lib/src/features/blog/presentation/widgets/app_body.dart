import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/favourites_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/watched_articles_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/home_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBody extends ConsumerWidget {
  const AppBody({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesList = ref.watch(articlesListProvider);
    return articlesList.when(
      data: (data) => <Widget>[
        HomeTab(),
        FavouritesScreen(),
        WatchedArticlesScreen(),
      ][currentIndex],
      error: (error, st) => ErrorWidget(error),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
