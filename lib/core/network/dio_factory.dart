import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:kalpas_machine_test/config/app_config.dart';

class DioClient {
  DioClient._();
  static final DioClient dioClient = DioClient._();
  static DioClient get instance => dioClient;
  late Dio dio;
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
