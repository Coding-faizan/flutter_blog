import 'package:objectbox/objectbox.dart';

@Entity()
class Article {
  int id;

  String source;
  String? author;
  @Index()
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  bool isFav;
  bool isWatched;

  Article({
    this.id = 0,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.isFav,
    required this.isWatched,
  });
}
