import 'package:dio/dio.dart';
import 'package:kalpas_machine_test/config/app_config.dart';
import 'package:kalpas_machine_test/core/network/dio_factory.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';

/// A service class that provides methods for accessing the news API.
///
/// The [ApiServices] class contains methods for making network requests
/// to the news API. It uses the [DioClient] singleton to perform HTTP requests.
/// The `getAllNews` method fetches news articles based on specified query parameters.
///
/// Example usage:
/// ```dart
/// final apiServices = ApiServices();
/// final response = await apiServices.getAllNews();
/// // Process the response as needed
/// ```
///
/// Methods:
/// - [getAllNews]: Fetches a list of news articles based on the query parameters.
class ApiServices {
  /// Fetches news articles from the news API.
  ///
  /// This method performs a GET request to the news API endpoint to retrieve
  /// a list of news articles. It uses the query parameter 'q' to filter the
  /// articles by category and includes the API key for authentication.
  ///
  /// Returns:
  /// - A [Response] object containing the raw data from the news API.
  ///
  /// Example usage:
  /// ```dart
  /// final response = await apiServices.getAllNews();
  /// final data = response.data;
  /// ```
  Future<Response> getAllNews() async {
    logInfo('inside the api service of getallnews');
    final Response response = await DioClient.instance.dio.get(
        ApiConstants.getAllNews,
        queryParameters: {
          'q': 'sports',
          'apiKey': AppConfig.apiKey,
        });
    logInfo('the raw data for getallnews is $response');
    return response;
  }
}

