import 'package:kalpas_machine_test/data/models/article_model.dart';

abstract class FavouritesRepository {
  Future<void> addToFavourites(Article article);
  List<Article> getFavourites();
  Future<void> removeFavorites(String id);
}