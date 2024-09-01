import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/models/source_model.dart';
part 'article_model.g.dart'; 

@HiveType(typeId: 0)
class Article extends HiveObject {
  @HiveField(0)
  final Source source;

  @HiveField(1)
  final String? author;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String url;

  @HiveField(5)
  final String? urlToImage;

  @HiveField(6)
  final String publishedAt;

  @HiveField(7)
  final String? content;

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
