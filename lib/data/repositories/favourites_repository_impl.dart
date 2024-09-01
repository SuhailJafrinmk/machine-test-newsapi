import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/data/datasources/local/local_data_source.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';

/// Implementation of the [FavouritesRepository] interface.
///
/// This class uses a local data source to manage favourite articles. It provides
/// the functionality to add, retrieve, and remove articles from the favourites list.
class FavouritesRepositoryImpl implements FavouritesRepository {
  /// The local data source that provides access to the favourite articles.
  final LocalDataSource localDataSource;

  /// Constructs a [FavouritesRepositoryImpl] with the provided [localDataSource].
  /// The constructer is injected using the get_it package
  FavouritesRepositoryImpl({required this.localDataSource});

  /// Adds the given [article] to the favourites list.
  ///
  /// Logs an informational message and delegates the actual storage to the
  /// [LocalDataSource]. This method is asynchronous.
  ///
  /// - Parameters:
  ///   - article: The [Article] object to be added to the favourites list.
  @override
  Future<void> addToFavourites(Article article) async {
    logInfo('inside the favouriterepository implementation class .......');
    await localDataSource.addFavorite(article);
  }

  /// Retrieves the list of favourite articles.
  ///
  /// Logs an informational message and retrieves the list of favourite articles
  /// from the [LocalDataSource].
  ///
  /// - Returns: A [List] of [Article] objects representing the favourite articles.
  @override
  List<Article> getFavourites() {
    logInfo('inside the getfavourites function of implementation class....');
    return localDataSource.getFavorites();
  }

  /// Removes the article with the specified [id] from the favourites list.
  ///
  /// Logs an informational message and delegates the removal operation to the
  /// [LocalDataSource]. This method is asynchronous.
  ///
  /// - Parameters:
  ///   - id: The unique identifier of the [Article] to be removed from the favourites list.
  ///  id is the title of the article to be removed
  @override
  Future<void> removeFavorites(String id) async {
    logInfo('inside the removefavourites function of repository implementation class....');
    await localDataSource.removeFavorites(id);
  }
}

