import 'package:dart_either/dart_either.dart';
import 'package:kalpas_machine_test/core/error/exceptions.dart';
import 'package:kalpas_machine_test/core/error/identify_exception.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/core/utils/typedef.dart';
import 'package:kalpas_machine_test/data/datasources/remote/api_service.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final ApiServices apiServices;
  NewsRepositoryImpl(this.apiServices);
  @override
  EitherResponse getAllNews() async {
    logInfo('inside the repository for getallnews....');
    try {
      final response = await apiServices.getAllNews();
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(mapStatusCodeToException(response.statusCode));
      }
    } catch (e) {
      logError('error occured ${e.toString()}');
      return Left(AppExceptions(errorMessage: e.toString()));
    }
  }
  @override
  EitherResponse getNewsDetails() {
    throw UnimplementedError();
  }
}
