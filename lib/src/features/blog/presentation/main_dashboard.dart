import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/favourites_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/watched_articles_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/home_tab.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int currentIndex = 0;

  final tabs = const [HomeTab(), FavouritesScreen(), WatchedArticlesScreen()];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    print('main dashboard build');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The News',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        backgroundColor: scheme.primary,
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
      body: tabs[currentIndex],
    );
  }
}
