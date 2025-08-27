import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/articles_list_controller.dart';
import 'package:flutter_blog/src/features/blog/presentation/screens/home_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/custom_error_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  static bool _hasDialogShown = false;

  @override
  void initState() {
    super.initState();
    if (!_hasDialogShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hasDialogShown = true;
        welcomeBottomSheet();
      });
    }
  }

  Future<dynamic> welcomeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      sheetAnimationStyle: AnimationStyle(
        duration: Duration(milliseconds: 500),
        reverseDuration: Duration(milliseconds: 500),
      ),
      builder: (_) => SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "🎉 Welcome to the News App!",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final articlesList = ref.watch(articleListControllerProvider);

    return articlesList.when(
      data: (data) => RefreshIndicator(
        onRefresh: () async {
          return ref
              .read(articleListControllerProvider.notifier)
              .pullToRefresh();
        },
        child: HomeScreen(),
      ),
      error: (error, st) => CustomErrorWidget(error: error),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
