import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/favourites_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/watched_articles_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/home_tab.dart';

class AppBody extends StatelessWidget {
  const AppBody({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      HomeTab(),
      FavouritesScreen(),
      WatchedArticlesScreen(),
    ][currentIndex];
  }
}
