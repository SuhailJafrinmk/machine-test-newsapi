import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';

abstract class LocalDataSource {
  Future<void> addFavorite(Article article);
  List<Article> getFavorites();
}

class LocalDataSourceImpl implements LocalDataSource {
  final Box<Article> favoritesBox;

  LocalDataSourceImpl(this.favoritesBox);

  @override
  Future<void> addFavorite(Article article) async {
    await favoritesBox.put(article.title, article);
  }

  @override
  List<Article> getFavorites() {
    return favoritesBox.values.toList();
  }
}
