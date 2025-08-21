// import 'package:flutter/material.dart';
// import 'package:flutter_blog/src/features/blog/data/repository/fake_blog_repository.dart';
// import 'package:flutter_blog/src/features/blog/presentation/category_controller.dart';
// import 'package:flutter_blog/src/features/blog/presentation/widgets/blog_card.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class BlogsList extends ConsumerWidget {
//   const BlogsList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final filteredBlogs = ref.watch(filteredBlogsProvider);
//     return Expanded(
//       child: AnimatedSwitcher(
//         duration: Duration(milliseconds: 700),
//         child: ListView.builder(
//           key: ValueKey(ref.read(categoryController.notifier).state),
//           itemCount: filteredBlogs.length,
//           itemBuilder: (_, index) => BlogCard(blog: filteredBlogs[index]),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
// import 'package:flutter_blog/src/features/blog/presentation/widgets/blog_card.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class BlogsList extends ConsumerWidget {
//   const BlogsList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final articles = ref.watch(articlesSourcesOverviewList);
//     return Expanded(
//       child: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (_, index) => BlogCard(blog: articles[index]),
//       ),
//     );
//   }
// }
