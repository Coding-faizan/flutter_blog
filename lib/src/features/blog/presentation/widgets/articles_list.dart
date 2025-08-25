import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesList extends ConsumerWidget {
  const ArticlesList({
    required this.fallbackText,
    required this.articles,
    super.key,
  });

  final List<Article> articles;
  final String fallbackText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: articles.isNotEmpty
          ? ListView.builder(
              itemCount: articles.length,
              itemBuilder: (_, index) => ArticleCard(article: articles[index]),
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
