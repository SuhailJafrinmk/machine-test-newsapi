import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:kalpas_machine_test/core/error/exceptions.dart';

/// Type alias for a Future that represents an Either response.
///
/// This alias defines a [Future] that resolves to an [Either] type. The
/// [Either] type can be either a [Left] containing an [AppExceptions] or a
/// [Right] containing a [Dio] [Response]. This is used to handle responses
/// from API calls, where the result can either be a successful [Response] 
/// or an error represented by an [AppExceptions].
///
/// Usage:
/// ```dart
/// Future<Either<AppExceptions, Response>> fetchSomeData() async {
///   // Your implementation here
/// }
/// ```
/// 
/// In the above example, the result of the API call can be processed based
/// on whether it is a success or an error.
typedef EitherResponse = Future<Either<AppExceptions, Response>>;
