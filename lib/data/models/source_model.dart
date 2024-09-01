import 'package:hive/hive.dart';

part 'source_model.g.dart'; 

/// Represents the source of an article.
///
/// The [Source] class models the origin of an article, including an optional
/// identifier and the name of the source. This class is integrated with Hive
/// for local storage, allowing it to be persisted and retrieved from a Hive database.
@HiveType(typeId: 1)
class Source extends HiveObject {
  /// The unique identifier of the source, if available.
  @HiveField(0)
  final String? id;

  /// The name of the source.
  @HiveField(1)
  final String name;

  /// Creates a [Source] instance.
  ///
  /// - [id]: The unique identifier of the source (optional).
  /// - [name]: The name of the source.
  Source({this.id, required this.name});

  /// Creates a [Source] instance from a JSON map.
  ///
  /// - [json]: A map containing source data in JSON format.
  ///
  /// Returns: A [Source] instance with data from the JSON map.
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  /// Converts the [Source] instance to a JSON map.
  ///
  /// Returns: A map representation of the [Source] instance in JSON format.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

