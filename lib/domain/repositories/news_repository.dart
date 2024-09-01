import 'package:dart_either/dart_either.dart';
import 'package:kalpas_machine_test/core/utils/typedef.dart';

/// Abstract class that defines the contract for a News Repository.
///
/// This repository is responsible for handling operations related to news data,
/// It utilizes the `Either` pattern to handle success and error cases.
/// The defintion for the type [EitherResponsse] is provided in core/utils/typedef.dart
abstract class NewsRepository {
  
  /// Fetches a list of all news articles.
  ///
  /// This method returns an [EitherResponse] that either contains a success
  /// response with the list of news articles or an error message in case of failure.
  ///
  /// - Returns: An [EitherResponse] that represents either a success or a failure.
  EitherResponse getAllNews();

}
