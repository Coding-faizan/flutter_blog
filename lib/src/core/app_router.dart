import 'package:flutter_blog/src/features/blog/presentation/main_dashboard.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => MainDashboard()),
      GoRoute(
        path: '/:articleId',
        builder: (context, state) =>
            ArticleDetailScreen(blogId: state.pathParameters['articleId']!),
      ),
    ],
  );
}
