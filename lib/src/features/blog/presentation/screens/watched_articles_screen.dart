import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/providers/articles_list_providers.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchedArticlesScreen extends ConsumerWidget {
  const WatchedArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchedArticles = ref.watch(watchedArticlesProvider);
    print('watch screen build');

    return ArticlesList(
      articles: watchedArticles,
      fallbackText: 'No Watched Articles',
    );
  }
}
