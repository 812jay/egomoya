import 'package:dio/dio.dart';

abstract class BaseRepo {
  final Dio dio = Dio();
  final String prefix = 'http://49.50.166.191:8080';
}
