import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:kalpas_machine_test/core/error/exceptions.dart';

typedef EitherResponse=Future<Either<AppExceptions,Response>>;