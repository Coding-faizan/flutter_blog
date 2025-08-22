import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesList extends ConsumerWidget {
  const ArticlesList({
    required this.length,
    required this.fallbackText,
    required this.articles,
    super.key,
  });

  final List<Article> articles;
  final int length;
  final String fallbackText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //todo: animation
    return Expanded(
      child: articles.isNotEmpty
          ? AnimatedSwitcher(
              duration: Duration(microseconds: 700),
              child: ListView.builder(
                key: ValueKey(length),
                itemCount: articles.length,
                itemBuilder: (_, index) =>
                    ArticleCard(article: articles[index]),
              ),
            )
          : Center(
              child: Text(
                fallbackText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    );
  }
}
