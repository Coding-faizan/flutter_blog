import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/sources_controller.dart';
import 'package:flutter_blog/src/features/blog/presentation/providers/articles_list_providers.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_sources_list.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredArticles = ref.watch(filteredArticlesProvider);
    final sourcesLength = ref.watch(sourcesControllerProvider).length;
    return Column(
      children: [
        ArticleSourcesList(),
        Expanded(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: ArticlesList(
              key: ValueKey(sourcesLength),
              articles: filteredArticles,
              fallbackText: 'No Articles',
            ),
          ),
        ),
      ],
    );
  }
}
