import 'package:flutter/material.dart';
import 'package:flutter_blog/src/features/blog/presentation/home_screen.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/:articleId',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ArticleDetailScreen(
            blogId: state.pathParameters['articleId']!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
