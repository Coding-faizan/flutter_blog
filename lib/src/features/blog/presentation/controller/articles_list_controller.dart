import 'dart:async';

import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesListController extends AsyncNotifier<List<Article>> {
  @override
  Future<List<Article>> build() async {
    final articles = await ref.watch(articleRepositoryProvider).getArticles();
    return articles;
  }

  void pullToRefresh() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref
          .read(articleRepositoryProvider)
          .getArticles(isPullToRefresh: true),
    );
  }
}

final articleListControllerProvider = AsyncNotifierProvider(
  ArticlesListController.new,
);
