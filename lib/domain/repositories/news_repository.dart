import 'package:dart_either/dart_either.dart';
import 'package:kalpas_machine_test/core/utils/typedef.dart';

abstract class NewsRepository{
  EitherResponse getAllNews();
  EitherResponse getNewsDetails();
}