import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  static const _url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a211cb802e0940fba76130cd198e9c97&pageSize=40';

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
