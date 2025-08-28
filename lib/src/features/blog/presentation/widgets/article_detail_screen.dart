import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/core/extensions.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/favourite_controller.dart';
import 'package:flutter_blog/src/features/blog/presentation/providers/articles_list_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleDetailScreen extends ConsumerWidget {
  const ArticleDetailScreen({required this.article, super.key});
  final Article article;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(articleProvider(article));

    return Scaffold(
      appBar: AppBar(title: Text(article.title), scrolledUnderElevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (article.urlToImage.isNotEmpty)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Failed to fetch Image'),
                      );
                    },
                  ),
                ),
              gapH12,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gapH8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(child: Icon(Icons.person)),
                            gapW8,
                            Text(
                              article.author ?? 'Anonymous',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: article.isFav
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          onPressed: () {
                            ref
                                .read(favouriteControllerProvider.notifier)
                                .toggleFav(article.id);
                            context.showSnackBar(
                              article.isFav
                                  ? 'Removed from favourites'
                                  : 'Added to favourites',
                            );
                          },
                        ),
                      ],
                    ),
                    gapH8,
                    Text(
                      article.content,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
