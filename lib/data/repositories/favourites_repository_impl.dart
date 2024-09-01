import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/data/datasources/local/local_data_source.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';

class FavouritesRepositoryImpl implements FavouritesRepository {
  final LocalDataSource localDataSource;
  FavouritesRepositoryImpl({required this.localDataSource});
  @override
  Future<void> addToFavourites(Article article) async {
    logInfo('inside the favouriterepository implementation class .......');
    await localDataSource.addFavorite(article);
  }

  @override
  List<Article> getFavourites() {
    logInfo('inside the getfavourites function of implementation class....');
    return localDataSource.getFavorites();
  }
  @override
  Future<void> removeFavorites(String id)async{
    logInfo('inside the removefavourites function of repository implementation class....');
    await localDataSource.removeFavorites(id);
  }
}
