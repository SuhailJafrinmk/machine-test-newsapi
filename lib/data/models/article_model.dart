import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/models/source_model.dart';

part 'article_model.g.dart'; 

/// Represents an article with its associated metadata.
///
/// The [Article] class is used to model an article's data, including its source,
/// author, title, description, URL, image URL, publication date, and content.
/// This class also integrates with Hive for local storage, allowing it to be
/// persisted and retrieved from a Hive database.
@HiveType(typeId: 0)
class Article extends HiveObject {
  /// The source of the article,source is a custom type
  @HiveField(0)
  final Source source;

  /// The author of the article, if available.
  @HiveField(1)
  final String? author;

  /// The title of the article.
  @HiveField(2)
  final String title;

  /// A brief description or summary of the article.
  @HiveField(3)
  final String? description;

  /// The URL where the full article can be found.
  @HiveField(4)
  final String url;

  /// The URL of the image associated with the article, if available.
  @HiveField(5)
  final String? urlToImage;

  /// The date and time when the article was published.
  @HiveField(6)
  final String publishedAt;

  /// The full content of the article, if available.
  @HiveField(7)
  final String? content;

  /// Creates an [Article] instance.
  ///
  /// All fields are required except for [author], [description], [urlToImage], and [content],
  /// which can be null.
  ///
  /// - [source]: The source of the article.
  /// - [author]: The author of the article (optional).
  /// - [title]: The title of the article.
  /// - [description]: A brief description or summary of the article (optional).
  /// - [url]: The URL where the full article can be found.
  /// - [urlToImage]: The URL of the image associated with the article (optional).
  /// - [publishedAt]: The date and time when the article was published.
  /// - [content]: The full content of the article (optional).
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

  /// Creates an [Article] instance from a JSON map.
  ///
  /// - [json]: A map containing article data in JSON format.
  ///
  /// Returns: An [Article] instance with data from the JSON map.
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

  /// Converts the [Article] instance to a JSON map.
  ///
  /// Returns: A map representation of the [Article] instance in JSON format.
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

