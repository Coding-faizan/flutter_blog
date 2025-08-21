import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/sources_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleSourcesList extends ConsumerWidget {
  const ArticleSourcesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sources = ref.watch(articlesSourcesProvider);
    final selectedSources = ref.watch(sourcesControllerProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => gapW8,
              itemCount: sources.length,
              itemBuilder: (_, index) {
                final source = sources[index];
                return FilterChip(
                  showCheckmark: false,
                  label: Text(source),
                  selected: selectedSources.contains(source),
                  onSelected: (bool value) => ref
                      .read(sourcesControllerProvider.notifier)
                      .toggleSource(source),
                );
              },
            ),
          ),
          if (selectedSources.isNotEmpty)
            IconButton(
              onPressed: () =>
                  ref.read(sourcesControllerProvider.notifier).unSelectAll(),
              icon: Icon(Icons.cancel),
            ),
        ],
      ),
    );
  }
}
