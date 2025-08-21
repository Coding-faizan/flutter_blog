import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/data/repository/fake_blog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogDetailScreen extends ConsumerWidget {
  const BlogDetailScreen({required this.blogId, super.key});
  final String blogId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(articleProvider(int.parse(blogId)));

    return Scaffold(
      appBar: AppBar(title: Text(article.title), scrolledUnderElevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (article.urlToImage.isNotEmpty)
                Image.network(
                  article.urlToImage,
                  height: 600,
                  fit: BoxFit.cover,
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
                      children: [
                        CircleAvatar(child: Icon(Icons.person)),
                        gapW8,
                        Text(
                          article.author ?? 'Anonymous',
                          style: Theme.of(context).textTheme.labelLarge,
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
