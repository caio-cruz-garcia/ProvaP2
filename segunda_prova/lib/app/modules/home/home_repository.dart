import 'package:dio/dio.dart';
import 'package:segunda_prova/app/models/placeholderModel.dart';
import 'package:segunda_prova/app/custom_dio/custom_dio.dart';

class HomeRepository {
  final CustomDio _client;
  HomeRepository(this._client);

  Future<List<placeholderModel>> getposts() async{
    try{
      var response = await _client.get("/posts");
      return (response.data as List).map((item) => placeholderModel.fromJson(item)).toList();
    }
    on DioError catch (e){
      throw(e.message);
    }
  }
}