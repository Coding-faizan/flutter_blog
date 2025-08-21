import 'package:flutter_blog/src/features/blog/data/local/article_entity.dart';

class Article {
  final int id;
  final String source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.id,
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}

extension ArticleX on Article {
  ArticleEntity toArticleEntity() {
    return ArticleEntity(
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt.toIso8601String(),
      content: content,
    );
  }
}
