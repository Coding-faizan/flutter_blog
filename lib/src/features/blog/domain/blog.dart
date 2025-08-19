class Blog {
  int id;
  String title;
  String content;
  String category;
  String author;
  DateTime date;
  String imageUrl;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.author,
    required this.date,
    required this.imageUrl,
  });
}
