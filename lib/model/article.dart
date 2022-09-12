// membuat class yang akan menjadi blueprint dari objek artike
import 'dart:convert';

class Article {
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

// tambahkan named constructor
  factory Article.fromJson(Map<String, dynamic> article) => Article(
        author: article["author"],
        title: article["title"],
        description: article["description"],
        url: article["url"],
        urlToImage: article["urlToImage"],
        publishedAt: DateTime.parse(article["publishedAt"]),
        content: article["content"],
      );
}

// konversi json atau json parsing

List<Article> parsedArticle(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}
