import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/core/extensions.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/favourite_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArticleCard extends ConsumerWidget {
  const ArticleCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => context.push('/${article.id}'),
      child: Card(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (article.urlToImage.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    article.urlToImage,
                    width: 180,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Failed to fetch Image');
                    },
                  ),
                ),
              gapW8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    gapH8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          article.publishedAt.toFormattedDate(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (article.isWatched) Icon(Icons.history),
                            SizedBox(
                              width: 30,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.favorite),
                                color: article.isFav ? scheme.primary : null,
                                onPressed: () async {
                                  await ref
                                      .read(
                                        favouriteControllerProvider.notifier,
                                      )
                                      .toggleFav(article.id);
                                  if (context.mounted) {
                                    context.showSnackBar(
                                      article.isFav
                                          ? 'Removed from favourites'
                                          : 'Added to favourites',
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
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
