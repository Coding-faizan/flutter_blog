import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/fake_blog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorySection extends ConsumerWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(blogsCategoryProvider);
    final selectedCategory = ref.watch(categoryController);
    return Row(
      spacing: 8,
      children: categories.map((c) {
        final isSelected = selectedCategory == c;
        return ChoiceChip(
          label: Text(c),
          selected: isSelected,
          onSelected: (value) {
            if (selectedCategory == c) {
              ref.read(categoryController.notifier).state = null;
            } else {
              ref.read(categoryController.notifier).state = c;
            }
          },
        );
      }).toList(),
    );
  }
}

final categoryController = StateProvider<String?>((ref) => null);
