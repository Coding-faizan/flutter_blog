import 'package:flutter_blog/src/constants/app_routes.dart';
import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:flutter_blog/src/features/blog/presentation/main_dashboard.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/article_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.mainDashboard,
        builder: (context, state) => MainDashboard(),
      ),
      GoRoute(
        path: AppRoutes.articleDetailScreen,
        builder: (context, state) {
          final article = state.extra as Article;
          return ArticleDetailScreen(article: article);
        },
      ),
    ],
  );
}
