import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/extensions.dart';
import 'package:flutter_blog/src/features/blog/domain/blog.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/blog_detail.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => BlogDetailScreen(blog: blog),
        ),
      ),
      child: Card(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  blog.imageUrl,
                  width: 180,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    gapH8,
                    Text(
                      blog.date.toFormattedDate(),
                      style: Theme.of(context).textTheme.labelMedium,
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
