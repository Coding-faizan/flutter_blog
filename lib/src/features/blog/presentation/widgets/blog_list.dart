import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/fake_blog_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogsList extends ConsumerWidget {
  const BlogsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredBlogs = ref.watch(filteredBlogsProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: filteredBlogs.length,
        itemBuilder: (_, index) => BlogCard(blog: filteredBlogs[index]),
      ),
    );
  }
}
