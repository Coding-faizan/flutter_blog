import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/article_search_text_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesSearchTextField extends ConsumerStatefulWidget {
  const ArticlesSearchTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<ArticlesSearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
          controller: _controller,
          style: Theme.of(context).textTheme.titleLarge,
          decoration: InputDecoration(
            hintText: 'Search Articles',
            icon: const Icon(Icons.search),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      ref.read(articlesSearchTextProvider.notifier).state = '';
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
          onChanged: (text) =>
              ref.read(articlesSearchTextProvider.notifier).state = text,
        );
      },
    );
  }
}
