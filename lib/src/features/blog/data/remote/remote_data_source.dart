import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  static const _url =
      'https://newsapi.org/v2/top-headlines?language=en&apiKey=08cb42d9dbf0419d82f3e6187ae397f8';

  Future<String> fetchBlogs() async {
    final url = Uri.parse(_url);
    try {
      final response = await http.get(url);
      return response.body;
    } on SocketException {
      rethrow;
    }
  }
}

final remoteDataSourceProvider = Provider((ref) {
  return RemoteDataSource();
});
