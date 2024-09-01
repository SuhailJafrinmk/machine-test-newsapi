import 'package:dart_either/dart_either.dart';
import 'package:kalpas_machine_test/core/error/exceptions.dart';
import 'package:kalpas_machine_test/core/error/identify_exception.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/core/utils/typedef.dart';
import 'package:kalpas_machine_test/data/datasources/remote/api_service.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';

/// Implementation of the [NewsRepository] interface.
///
/// This class is responsible for handling the fetching of news data from a remote
/// data source, specifically through the use of [ApiServices]. It uses the
/// `Either` pattern to handle success and error cases, making it easier to manage
/// responses and errors in the application.
class NewsRepositoryImpl implements NewsRepository {
  final ApiServices apiServices;

  /// Constructor for [NewsRepositoryImpl].
  ///
  /// Takes an instance of [ApiServices] which handles the actual API calls.
  /// The constructer is injected using get_it
  NewsRepositoryImpl(this.apiServices);

  /// Fetches a list of all news articles from the remote data source.
  ///
  /// This method attempts to retrieve news data by making a call to the
  /// [apiServices.getAllNews()] method. If the API call is successful and returns
  /// a status code of 200, the method returns a [Right] with the response data.
  /// If the status code indicates an error, it maps the status code to a custom
  /// exception and returns it in a [Left]. In case of any other exception during
  /// the API call, it catches the exception, logs the error, and returns an
  /// [AppExceptions] in a [Left].
  ///
  /// - Returns: An [EitherResponse] that represents either the successful response
  /// or an error in case of failure.
  @override
  EitherResponse getAllNews() async {
    logInfo('Inside the repository for getAllNews...');
    try {
      final response = await apiServices.getAllNews();
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(mapStatusCodeToException(response.statusCode));
      }
    } catch (e) {
      logError('Error occurred: ${e.toString()}');
      return Left(AppExceptions(errorMessage: e.toString()));
    }
  }
}
