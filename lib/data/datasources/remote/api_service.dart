import 'package:dio/dio.dart';
import 'package:kalpas_machine_test/config/app_config.dart';
import 'package:kalpas_machine_test/core/network/dio_factory.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';

class ApiServices {
  Future<Response> getAllNews() async {
    logInfo('inside the api service of getallnews');
    final Response response = await DioClient.instance.dio.get(
        ApiConstants.getTopHeadlines,
        queryParameters: {
          'country': 'in',
          'apiKey': AppConfig.apiKey
          });
    logInfo('the raw data for getallnews is $response');
    return response;
  }
}
