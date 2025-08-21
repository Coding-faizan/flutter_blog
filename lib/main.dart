import 'package:flutter/material.dart';
import 'package:flutter_blog/app_router.dart';
import 'package:flutter_blog/src/features/blog/data/local/local_data_source.dart';
import 'package:flutter_blog/src/features/blog/data/local/object_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBox = await ObjectBox.initObx();
  runApp(
    ProviderScope(
      overrides: [
        localDataSourceProvider.overrideWithValue(
          LocalDataSource(objectBox: objectBox),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRouter.router);
  }
}
