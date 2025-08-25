import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchedArticlesScreen extends ConsumerWidget {
  const WatchedArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchedArticles = ref.watch(watchedArticlesProvider);

    return ArticlesList(
      articles: watchedArticles,
      fallbackText: 'No Watched Articles',
    );
  }
}
