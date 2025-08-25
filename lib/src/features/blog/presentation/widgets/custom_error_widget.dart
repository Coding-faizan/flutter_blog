import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/features/blog/data/repository/article_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomErrorWidget extends ConsumerWidget {
  final Object error;

  const CustomErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String errorText;
    if (error is SocketException) {
      errorText = 'No Internet';
    } else {
      errorText = 'Something went wrong';
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => ref.invalidate(articlesListProvider),
            child: Text('Retry'),
          ),
          gapH12,
          Text(errorText, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
