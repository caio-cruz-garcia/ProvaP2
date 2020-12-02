
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_repository.dart';
import 'create_status.dart';

part 'create_controller.g.dart';

@Injectable()
class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  final HomeRepository repository;

  _CreateControllerBase(this.repository) {

  }

  @observable
  String title = '';

  @action
  changeTitle(String value) => title = value;

  @observable
  String body = '';

  @action
  changeBody(String value) => body = value;


  @observable
  CreateStatus status = CreateStatus.none;
  @action
  Future<void> CreatePosts() async {
    status = CreateStatus.loading;
    try {
      final response = await repository.createPost({body: body,title: title});
      status = CreateStatus.success..value = response;
    } catch (e) {
      status = CreateStatus.error..value = e;
    }
  }
}
