import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/datasources/local/local_data_source.dart';
import 'package:kalpas_machine_test/data/datasources/remote/api_service.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/data/repositories/favourites_repository_impl.dart';
import 'package:kalpas_machine_test/data/repositories/news_repository_impl.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';

final sl = GetIt.instance;

Future<void> init()async{
  sl.registerLazySingleton<ApiServices>(() => ApiServices());
  sl.registerLazySingleton<NewsRepositoryImpl>(() => NewsRepositoryImpl(sl<ApiServices>()));
  Box<Article> favoritesBox;
  if (!Hive.isBoxOpen('favoritesBox')) {
    favoritesBox = await Hive.openBox<Article>('favoritesBox');
  } else {
    favoritesBox = Hive.box<Article>('favoritesBox');
  }
  sl.registerLazySingleton<Box<Article>>(() => favoritesBox);
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl<Box<Article>>()));
  sl.registerLazySingleton<FavouritesRepository>(() => FavouritesRepositoryImpl(localDataSource: sl<LocalDataSource>()));
}
