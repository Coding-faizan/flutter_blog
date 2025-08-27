import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/articles_list_controller.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/sources_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articlesSourcesProvider = Provider((ref) {
  final articles = ref.read(articleListControllerProvider).valueOrNull ?? [];

  final sources = articles.map((a) => a.source).toSet().toList();
  return sources;
});

final filteredArticlesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articleListControllerProvider).asData?.value ?? [];
  final selectedSources = ref.watch(sourcesControllerProvider);
  final filteredArticles = articles
      .where((a) => selectedSources.contains(a.source))
      .toList();

  return filteredArticles.isEmpty ? articles : filteredArticles;
});

final articleProvider = Provider.autoDispose.family<Article, int>((ref, id) {
  final articles = ref.watch(articleListControllerProvider).asData?.value ?? [];
  final article = articles.firstWhere((a) => a.id == id);
  // Docs says it leads to unexpected behaviour. what to do instead
  ref.onDispose(() {
    if (!article.isWatched) {
      ref.read(articleRepositoryProvider).markWatched(id);
      ref.invalidate(articleListControllerProvider);
    }
  });

  return article;
});

final favArticlesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articleListControllerProvider).asData?.value ?? [];
  final favArticles = articles.where((a) => a.isFav).toList();
  return favArticles;
});

final watchedArticlesProvider = Provider.autoDispose((ref) {
  final articles = ref.watch(articleListControllerProvider).asData?.value ?? [];
  final watchedArticles = articles.where((a) => a.isWatched).toList();

  return watchedArticles;
});
