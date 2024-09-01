import 'package:kalpas_machine_test/data/models/article_model.dart';

/// Abstract class that defines the contract for a favourites repository.
///
/// This repository manages the addition, retrieval, and removal of favourite articles.
/// 
/// The concrete implementation is inside the data/repositories/favourites_repository_impl.dart
abstract class FavouritesRepository {
  
  /// Adds the given [article] to the favourites list.
  ///
  /// This method is asynchronous and will return a [Future] that completes when the operation is done.
  ///
  /// - Parameters:
  ///   - article: The [Article] object to be added to the favourites list.
  Future<void> addToFavourites(Article article);

  /// Retrieves the list of favourite articles.
  ///
  /// This method returns a list of [Article] objects that have been marked as favourites.
  ///
  /// - Returns: A [List] of [Article] objects representing the favourite articles.
  List<Article> getFavourites();

  /// Removes the article with the specified [id] from the favourites list.
  ///
  /// This method is asynchronous and will return a [Future] that completes when the operation is done.
  ///
  /// - Parameters:
  ///   - id: The unique identifier of the [Article] to be removed from the favourites list.
  Future<void> removeFavorites(String id);
}
