import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/favourites_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/home_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/watched_articles_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          NavigationDestination(icon: Icon(Icons.history), label: 'Watched'),
        ],
        onDestinationSelected: (value) => setState(() {
          currentIndex = value;
        }),
        selectedIndex: currentIndex,
        backgroundColor: scheme.surface,
        indicatorColor: scheme.primaryContainer,
      ),
      body: SafeArea(
        child: <Widget>[
          HomeScreen(),
          FavouritesScreen(),
          WatchedArticlesScreen(),
        ][currentIndex],
      ),
    );
  }
}
