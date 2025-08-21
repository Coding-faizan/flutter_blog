import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_sources_list.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/articles_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesList = ref.watch(articlesListProvider);

    return Scaffold(
      body: SafeArea(
        child: articlesList.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [ArticleSourcesList(), ArticlesList()]),
          ),
          error: (error, st) => Center(child: Text(error.toString())),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
