import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';

/// Abstract class defining the contract for a local data source.
///
/// This class outlines the methods required for managing favorite articles
/// in local storage. Implementations of this class should provide the actual
/// logic for storing, retrieving, and removing articles from local storage.
abstract class LocalDataSource {
  /// Adds an article to the favorites list.
  ///
  /// This method is intended to store the provided [article] in local storage.
  /// The implementation should handle the actual storage logic.
  ///
  /// Parameters:
  /// - [article]: The [Article] object to be added to the favorites.
  Future<void> addFavorite(Article article);

  /// Retrieves the list of favorite articles.
  ///
  /// This method fetches all the articles stored as favorites in local storage.
  ///
  /// Returns:
  /// - A [List<Article>] containing all the favorite articles.
  List<Article> getFavorites();

  /// Removes an article from the favorites list.
  ///
  /// This method deletes the article identified by [id] from local storage.
  ///
  /// Parameters:
  /// - [id]: The identifier of the article to be removed.
  Future<void> removeFavorites(String id);
}

/// Implementation of the [LocalDataSource] using Hive for local storage.
///
/// This class provides concrete implementations of the methods defined in the
/// [LocalDataSource] interface, using a [Hive Box] to manage favorite articles.
class LocalDataSourceImpl implements LocalDataSource {
  final Box<Article> favoritesBox;

  /// Constructs a [LocalDataSourceImpl] with the provided [favoritesBox].
  ///
  /// Parameters:
  /// - [favoritesBox]: The [Box<Article>] instance used for storing favorite articles.
  LocalDataSourceImpl(this.favoritesBox);

  @override
  Future<void> addFavorite(Article article) async {
    await favoritesBox.put(article.title, article);
  }

  @override
  List<Article> getFavorites() {
    return favoritesBox.values.toList();
  }

  @override
  Future<void> removeFavorites(String id) async {
    await favoritesBox.delete(id);
  }
}
