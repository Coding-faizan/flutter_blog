import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blog/src/constants/app_sizes.dart';
import 'package:flutter_blog/src/features/blog/presentation/controller/articles_list_controller.dart';
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
            onPressed: () => ref.invalidate(articleListControllerProvider),
            child: Text('Retry'),
          ),
          gapH12,
          Text(errorText, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
