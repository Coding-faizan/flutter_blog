import 'package:flutter_blog/src/features/blog/domain/article.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ArticleEntity {
  int id;

  String source;
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleEntity({
    this.id = 0,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}

extension ArticleEntityX on ArticleEntity {
  Article toArticle() {
    return Article(
      id: id,
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: DateTime.parse(publishedAt),
      content: content,
    );
  }
}
