import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_repository.dart';
import 'home_status.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase(this.repository);

  @observable
  HomeStatus status = HomeStatus.none;

  @action
  Future<void> fetchPosts() async {
    status = HomeStatus.loading;
    try {
      final response = await repository.fetchPosts();
      status = HomeStatus.sucess..value = response;
    } catch (e) {
      status = HomeStatus.error..value = e;
    }
  }
}
