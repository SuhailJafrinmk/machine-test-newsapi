import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:kalpas_machine_test/config/app_config.dart';

/// A singleton class for managing Dio HTTP client instances.
///
/// This class provides a single instance of Dio configured with base options,
/// including base URL, timeouts, and default headers. The singleton pattern ensures
/// that only one instance of DioClient is created and used throughout the application.
class DioClient {
  DioClient._();

  /// The single instance of [DioClient].
  static final DioClient dioClient = DioClient._();

  /// Provides access to the singleton instance of [DioClient].
  static DioClient get instance => dioClient;

  /// The Dio instance used for making HTTP requests.
  late Dio dio;

  /// Initializes the Dio instance with base options.
  ///
  /// This method sets up the [Dio] instance with the following configuration:
  /// - `baseUrl`: The base URL for all HTTP requests, retrieved from [AppConfig].
  /// - `connectTimeout`: The timeout duration for connecting to the server, retrieved from [AppConfig].
  /// - `receiveTimeout`: The timeout duration for receiving data from the server, retrieved from [AppConfig].
  /// - `headers`: Default headers for all HTTP requests, including `Content-Type` and `Accept`.
  ///
  /// Call this method before making any HTTP requests to ensure the Dio instance is properly configured.
  void initialize() {
    dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: AppConfig.connectTimeout),
      receiveTimeout: const Duration(seconds: AppConfig.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
  }
}
