
class AppConfig {
  static const String apiKey = 'ebdc6991bb9d4614b900592b7b675a9d';
  static const String baseUrl = 'https://newsapi.org';
  static const int connectTimeout = 15;
  static const int receiveTimeout = 15;
  static const String hiveBoxName = 'appBox';
  static String getFullUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }
}
