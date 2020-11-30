
import 'package:dio/dio.dart';
import 'package:segunda_prova/app/Api/api_constant.dart';
import 'package:segunda_prova/app/custom_dio/interceptors.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = URL_API;
    client.interceptors.add(CustomInterceptors());
    client.options.connectTimeout = 5000;
  }
}