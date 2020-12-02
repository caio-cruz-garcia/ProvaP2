import 'package:dio/dio.dart';
import 'package:segunda_prova/app/app_module.dart';
import 'package:segunda_prova/app/custom_dio/custom_dio.dart';
import 'package:segunda_prova/app/modules/home/home_repository.dart';


import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        Bind((i) => HomeRepository(i.get<Dio>())),

      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
