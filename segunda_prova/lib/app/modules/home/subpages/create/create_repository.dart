
import 'package:mobx/mobx.dart';
import 'package:segunda_prova/app/models/placeholderModel.dart';
import 'package:segunda_prova/app/modules/home/home_repository.dart';

class  CreateRepository {
  final HomeRepository repository;

  CreateRepository(this.repository)

  String title;
  String body;

  var post = BehaviorSubject<placeholderModel>();


  placeholderModel get postValue => post.value;
  Observable get responseOut => post.switchMap(observablePost);
  Sink<placeholderModel> get PostIn => post.sink;

  Stream observablePost(placeholderModel data) async*{
    yield 0;
    final response = await repository.createPost(data.toJson());
    yield response;
  }

  @override
  void dispose(){
    post.close();
    super.dispose();
  }
}