
import 'package:get_it/get_it.dart';
import 'package:kalpas_machine_test/data/datasources/remote/api_service.dart';
import 'package:kalpas_machine_test/data/repositories/news_repository_impl.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<ApiServices>(() => ApiServices());
  sl.registerLazySingleton<NewsRepositoryImpl>(() => NewsRepositoryImpl(sl<ApiServices>()));
}
