import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:segunda_prova/app/models/placeholderModel.dart';
import 'package:segunda_prova/app/modules/home/subpages/create/create_module.dart';
import 'home_controller.dart';
import 'home_status.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            FlatButton(
              child: Text("Adicionar",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/create');
              },
            )
          ],
        ),
        body: Observer(builder: (_) {
          if (controller.status == HomeStatus.loading) {
            return CircularProgressIndicator();
          } else if (controller.status == HomeStatus.success) {
            final list = controller.status.value as List<placeholderModel>;
            if (list.isNotEmpty) {
              return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(list[index].title),
                  ));
            } else {
              return Text("lista Vazia");
            }

          }

          else if (controller.status == HomeStatus.error) {
            return Text("${controller.status.value}");
          } else {
            return Container(color: Colors.red,);
          }
        }
        )
    );
  }
}