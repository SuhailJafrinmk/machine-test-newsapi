import 'package:kalpas_machine_test/core/error/exceptions.dart';

/// Maps an HTTP status code to a specific [AppExceptions] subclass.
///
/// This function takes an optional [statusCode] and returns an instance of a subclass
/// of [AppExceptions] that corresponds to the given HTTP status code. Each HTTP status code
/// is mapped to a specific exception type with a predefined error message.
///
/// The function handles common HTTP status codes and provides relevant exception types.
/// If the status code does not match any of the predefined cases, a generic [AppExceptions]
/// instance with the status code included in the error message is returned.
///
/// [statusCode] is an optional integer that represents the HTTP status code returned from
/// a server response.
///
/// Returns:
/// - An instance of [AppExceptions] or one of its subclasses that corresponds to the
///   given HTTP status code.
///
/// Example usage:
/// ```dart
/// final exception = mapStatusCodeToException(404);
/// // exception is an instance of [ResourceNotFoundException].
/// ```
AppExceptions mapStatusCodeToException(int? statusCode) {
  switch (statusCode) {
    case 400:
      return AppExceptions(errorMessage: 'Bad request');
    case 401:
      return UnauthorizedException();
    case 403:
      return AppExceptions(errorMessage: 'Forbidden');
    case 404:
      return ResourceNotFoundException();
    case 405:
      return AppExceptions(errorMessage: "Method not allowed");
    case 408:
      return RequestTimeOutException();
    case 409:
      return AppExceptions(errorMessage: 'Conflict');
    case 429:
      return AppExceptions(errorMessage: 'Too many requests');
    case 500:
      return InternalServerException();
    case 501:
      return AppExceptions(errorMessage: 'Not implemented');
    case 502:
      return AppExceptions(errorMessage: 'Bad gateway');
    case 503:
      return AppExceptions(errorMessage: 'Service unavailable');
    case 504:
      return AppExceptions(errorMessage: 'Gateway timeout');
    default:
      return AppExceptions(errorMessage: 'Error! $statusCode');
  }
}
