import 'package:flutter_blog/src/features/blog/domain/article.dart';

class ArticleDto {
  String source;
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleDto({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    final article = ArticleDto(
      source: json['source']['name'],
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );

    return article;
  }
}

extension ArticleDtoX on ArticleDto {
  Article toArticle() {
    return Article(
      id: 0,
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: DateTime.parse(publishedAt),
      content: content,
      isFav: false,
      isWatched: false,
    );
  }
}
