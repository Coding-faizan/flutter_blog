import 'package:flutter/material.dart';

import 'package:flutter_blog/src/features/blog/presentation/screens/favourites_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/watched_articles_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/home_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBody extends ConsumerWidget {
  const AppBody({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return <Widget>[
      HomeTab(),
      FavouritesScreen(),
      WatchedArticlesScreen(),
    ][currentIndex];
  }
}
