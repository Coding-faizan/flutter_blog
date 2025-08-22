import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/extensions.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/favourite_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArticleCard extends ConsumerWidget {
  const ArticleCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.publishedAt.toFormattedDate(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Row(
                          children: [
                            if (article.isWatched) Icon(Icons.history),
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: article.isFav
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.primaryFixedDim
                                  : null,
                              onPressed: () => ref
                                  .read(favouriteControllerProvider.notifier)
                                  .toggleFav(article.id),
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

// Card(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             if (article.urlToImage.isNotEmpty)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   article.urlToImage,
//                   fit: BoxFit.cover,
//                   height: 200,
//                 ),
//               ),
//             gapH8,
//             Text(
//               article.title,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     );
