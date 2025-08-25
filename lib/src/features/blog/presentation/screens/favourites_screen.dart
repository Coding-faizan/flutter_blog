import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favArticles = ref.watch(favArticlesProvider);
    final favArticlesLength = favArticles.length;
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: ArticlesList(
          key: ValueKey(favArticlesLength),
          articles: favArticles,
          fallbackText: 'No Favourite Articles',
        ),
      ),
    );
  }
}
