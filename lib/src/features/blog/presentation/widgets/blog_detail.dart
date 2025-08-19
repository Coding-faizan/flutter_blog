import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/features/blog/domain/blog.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(blog.title), scrolledUnderElevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(blog.imageUrl, height: 600, fit: BoxFit.cover),
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
                      blog.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gapH8,
                    Row(
                      children: [
                        CircleAvatar(child: Icon(Icons.person)),
                        gapW8,
                        Text(
                          blog.author,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    gapH8,
                    Text(
                      blog.content,
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
