
import 'package:mobx/mobx.dart';
import 'package:segunda_prova/app/models/placeholderModel.dart';
import 'package:segunda_prova/app/modules/home/home_repository.dart';

class  CreateRepository {
  final HomeRepository repository;

  CreateRepository(this.repository){
    responseOut = post.switchMap(observablePost);
  }

  String title;
  String body;

  var post = BehaviorSubject<placeholderModel>();


  placeholderModel get postValue => post.value;
  Observable<int> responseOut;
  Sink<placeholderModel> get PostIn => post.sink;

  Stream<int> observablePost(placeholderModel data) async*{
    yield 0;
    try{
      var response = await repository.createPost(data.toJson());
      yield response;
    }catch(e){
      throw (e);
    }
  }

  @override
  void dispose() {
    post.close();
    super.dispose();
  }
}