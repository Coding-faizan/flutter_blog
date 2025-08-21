import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/sources_controller.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesList extends ConsumerWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredArticles = ref.watch(filteredArticlesProvider);
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: ListView.builder(
          key: ValueKey(
            ref.read(sourcesControllerProvider.notifier).state.length,
          ),
          itemCount: filteredArticles.length,
          itemBuilder: (_, index) =>
              ArticleCard(article: filteredArticles[index]),
        ),
      ),
    );
  }
}
