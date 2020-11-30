import 'package:dio/dio.dart';
import 'package:segunda_prova/app/models/placeholderModel.dart';
import 'package:segunda_prova/app/custom_dio/custom_dio.dart';

class HomeRepository {
  final Dio _client;
  HomeRepository(this._client);

  Future fetchPosts() async {
    final response =
    await _client.get('https://jsonplaceholder.typicode.com/posts');
        return (response.data as List)
        .map((e) => placeholderModel.fromJson(e))
        .toList();
  }

  @override
  void dispose() {}
}