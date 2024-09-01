import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/datasources/local/local_data_source.dart';
import 'package:kalpas_machine_test/data/datasources/remote/api_service.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/data/repositories/favourites_repository_impl.dart';
import 'package:kalpas_machine_test/data/repositories/news_repository_impl.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';

/// Dependency injection container instance.
final sl = GetIt.instance;

/// Initializes the service locator by registering dependencies.
///
/// This function sets up the necessary dependencies for the application,
/// including services, repositories, and data sources. It configures the
/// `GetIt` instance to provide instances of the required classes throughout
/// the app.
///
/// The following dependencies are registered:
/// - [ApiServices]: Provides remote API services.
/// - [NewsRepositoryImpl]: Implements [NewsRepository] using [ApiServices].
/// - [Box<Article>]: A Hive box for storing favorite articles.
/// - [LocalDataSourceImpl]: Implements [LocalDataSource] using the Hive box.
/// - [FavouritesRepositoryImpl]: Implements [FavouritesRepository] using [LocalDataSource].
Future<void> init() async {
  // Register ApiServices as a lazy singleton.
  sl.registerLazySingleton<ApiServices>(() => ApiServices());

  // Register NewsRepositoryImpl as a lazy singleton, injecting ApiServices.
  sl.registerLazySingleton<NewsRepositoryImpl>(
      () => NewsRepositoryImpl(sl<ApiServices>()));

  // Open or retrieve the Hive box for storing favorite articles.
  Box<Article> favoritesBox;
  if (!Hive.isBoxOpen('favoritesBox')) {
    favoritesBox = await Hive.openBox<Article>('favoritesBox');
  } else {
    favoritesBox = Hive.box<Article>('favoritesBox');
  }
  
  // Register the Hive box as a lazy singleton.
  sl.registerLazySingleton<Box<Article>>(() => favoritesBox);

  // Register LocalDataSourceImpl as a lazy singleton, injecting the Hive box.
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sl<Box<Article>>()));

  // Register FavouritesRepositoryImpl as a lazy singleton, injecting LocalDataSource.
  sl.registerLazySingleton<FavouritesRepository>(
      () => FavouritesRepositoryImpl(localDataSource: sl<LocalDataSource>()));
}
