import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/providers/articles_list_providers.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_search_text_field.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_sources_list.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredArticles = ref.watch(articlesFilteredBySearchProvider);
    print('home screen build');
    return Column(
      children: [
        ArticleSourcesList(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ArticlesSearchTextField(),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: ArticlesList(
              key: ValueKey(filteredArticles.length),
              articles: filteredArticles,
              fallbackText: 'No Articles',
            ),
          ),
        ),
      ],
    );
  }
}
