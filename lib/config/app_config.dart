
/// A class that holds configuration constants for the application.
///
/// The [AppConfig] class contains static constants that are used for configuring
/// the application's API requests and other related settings. It includes the API key,
/// base URL for the API, and timeout settings for network requests.
///
/// All constants are defined as static fields, allowing them to be accessed directly
/// without needing to instantiate the class.
///
/// Constants:
/// - [apiKey]: The API key used for authenticating requests to the news API.
/// - [baseUrl]: The base URL of the news API.
/// - [connectTimeout]: The timeout duration (in seconds) for establishing a connection.
/// - [receiveTimeout]: The timeout duration (in seconds) for receiving a response.
///
/// Example usage:
/// ```dart
/// final response = await Dio().get(
///   '${AppConfig.baseUrl}/v2/top-headlines',
///   queryParameters: {
///     'apiKey': AppConfig.apiKey,
///     'country': 'us',
///   },
///   options: Options(
///     connectTimeout: AppConfig.connectTimeout * 1000, // Convert to milliseconds
///     receiveTimeout: AppConfig.receiveTimeout * 1000, // Convert to milliseconds
///   ),
/// );
/// ```
class AppConfig {
  /// The API key used for authenticating requests to the news API.
  static const String apiKey = 'ebdc6991bb9d4614b900592b7b675a9d';
  
  /// The base URL of the news API.
  static const String baseUrl = 'https://newsapi.org';
  
  /// The timeout duration (in seconds) for establishing a connection.
  static const int connectTimeout = 15;
  
  /// The timeout duration (in seconds) for receiving a response.
  static const int receiveTimeout = 15;
}
