import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/fake_blog_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/blog_list.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/category_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogLists = ref.watch(blogsListProvider);

    return Scaffold(
      body: SafeArea(
        child: blogLists.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SizedBox(height: 60, child: CategorySection())],
                ),
                BlogsList(),
              ],
            ),
          ),
          error: (error, st) => Center(child: Text(error.toString())),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
