// import 'package:flutter/material.dart';
// import 'package:flutter_blog/src/extensions.dart';
// import 'package:flutter_blog/src/features/blog/data/repository/fake_blog_repository.dart';
// import 'package:flutter_blog/src/features/blog/presentation/category_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CategorySection extends ConsumerWidget {
//   const CategorySection({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final categories = ref.watch(blogsCategoryProvider);
//     final selectedCategory = ref.watch(categoryController);
//     return Row(
//       spacing: 8,
//       children: categories.map((c) {
//         final isSelected = selectedCategory == c;
//         return ChoiceChip(
//           label: Text(c.capitalizeFirst()),
//           selected: isSelected,
//           showCheckmark: false,
//           onSelected: (value) {
//             if (selectedCategory == c) {
//               ref.read(categoryController.notifier).state = null;
//             } else {
//               ref.read(categoryController.notifier).state = c;
//             }
//           },
//         );
//       }).toList(),
//     );
//   }
// }
