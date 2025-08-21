// import 'package:flutter/material.dart';
// import 'package:flutter_blog/src/constants/app_sizes.dart';
// import 'package:flutter_blog/src/extensions.dart';
// import 'package:flutter_blog/src/features/blog/domain/article.dart';

// class BlogCard extends StatelessWidget {
//   const BlogCard({super.key, required this.blog});
//   final Article blog;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       //onTap: () => context.push('/${blog.id}'),
//       child: Card(
//         color: Colors.white70,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               if (blog.urlToImage.isNotEmpty)
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     blog.urlToImage,
//                     width: 180,
//                     height: 120,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       blog.title,
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                     gapH8,
//                     Text(
//                       blog.publishedAt.toFormattedDate(),
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
