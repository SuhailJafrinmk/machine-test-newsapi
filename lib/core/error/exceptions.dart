/// A base class for application-specific exceptions.
///
/// This class implements the [Exception] interface and provides a way to represent
/// general application errors with an associated error message.
class AppExceptions implements Exception {
  /// The error message associated with the exception.
  final String errorMessage;

  /// Creates an instance of [AppExceptions] with a required error message.
  ///
  /// [errorMessage] should provide a description of the error encountered.
  AppExceptions({required this.errorMessage});
}

/// An exception thrown when there is no internet connection.
///
/// This class extends [AppExceptions] and provides a specific error message for
/// scenarios where the application cannot connect to the internet.
class InternetException extends AppExceptions {
  /// Creates an instance of [InternetException] with a predefined error message.
  InternetException() : super(errorMessage: 'No internet connection');
}

/// An exception thrown when there is a server-side error.
///
/// This class extends [AppExceptions] and provides a specific error message for
/// situations where the server encounters an issue while processing the request.
class ServerException extends AppExceptions {
  /// Creates an instance of [ServerException] with a predefined error message.
  ServerException() : super(errorMessage: 'Something went wrong');
}

/// An exception thrown when a request times out.
///
/// This class extends [AppExceptions] and provides a specific error message for
/// scenarios where the request to the server exceeds the allowed time limit.
class RequestTimeOutException extends AppExceptions {
  /// Creates an instance of [RequestTimeOutException] with a predefined error message.
  RequestTimeOutException() : super(errorMessage: 'Request time out');
}

/// An exception thrown when a user is not authorized.
///
/// This class extends [AppExceptions] and provides a specific error message for
/// scenarios where the user does not have the necessary permissions or credentials.
class UnauthorizedException extends AppExceptions {
  /// Creates an instance of [UnauthorizedException] with a predefined error message.
  UnauthorizedException() : super(errorMessage: 'User not authorized');
}

/// An exception thrown when a requested resource is not found.
///
/// This class extends [AppExceptions] and provides a specific error message for
/// situations where the requested resource cannot be located.
class ResourceNotFoundException extends AppExceptions {
  /// Creates an instance of [ResourceNotFoundException] with a predefined error message.
  ResourceNotFoundException() : super(errorMessage: 'Resource not found');
}

/// An exception thrown when there is an internal server issue.
///
/// This class extends [AppExceptions] and provides a specific error message for
/// scenarios where the server encounters an internal error while processing the request.
class InternalServerException extends AppExceptions {
  /// Creates an instance of [InternalServerException] with a predefined error message.
  InternalServerException() : super(errorMessage: 'Issue with the server');
}
