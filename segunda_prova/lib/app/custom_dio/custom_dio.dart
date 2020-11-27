
import 'package:dio/dio.dart';
import 'package:segunda_prova/app/Api/api_constant.dart';
import 'package:segunda_prova/app/custom_dio/interceptors.dart';

class CustomDio extends Dio{
  CustomDio(){
    options.baseUrl = URL_API;
    interceptors.add(CustomInterceptors());
    options.connectTimeout = 5000;
  }
}