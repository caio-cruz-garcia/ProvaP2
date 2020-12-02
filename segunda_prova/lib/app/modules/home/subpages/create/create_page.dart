
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  final String title;
  const CreatePage({Key key, this.title = "Create"}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
         body: Container(
           child:  Column(
             children: [
               Observer(builder: (_){
                 return TextFormField(onChanged: controller.changeTitle,
                 decoration: const InputDecoration(
                   hintText: 'Write something',
                   labelText: 'Title'
                 ),
                 );
             }),
               Observer(builder:(_){
                 return TextFormField(onChanged: controller.changeBody,
                 decoration:  const InputDecoration(
                   hintText: 'Write something',
                   labelText: 'Body'
                 ),
                 );
             }),
               RaisedButton(onPressed: controller.CreatePosts,
               child: Text('Adicionar', style: TextStyle(fontSize: 20),)
               )
             ],
           ),
         )
    );
  }
}
