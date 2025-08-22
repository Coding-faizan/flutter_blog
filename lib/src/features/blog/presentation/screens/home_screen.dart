import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/sources_controller.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_sources_list.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesList = ref.watch(articlesListProvider);

    return articlesList.when(
      data: (data) {
        //Todo: Extract in a seperate widget
        final filteredArticles = ref.watch(filteredArticlesProvider);
        final sourcesLength = ref.read(sourcesControllerProvider).length;
        return Column(
          children: [
            ArticleSourcesList(),
            ArticlesList(
              length: sourcesLength,
              articles: filteredArticles,
              fallbackText: 'No Articles',
            ),
          ],
        );
      },
      error: (error, st) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
