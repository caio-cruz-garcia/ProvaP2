
import 'dart:async';
import 'dart:html';


import 'package:flutter/material.dart';
import 'package:segunda_prova/app/models/placeholderModel.dart';
import 'package:segunda_prova/app/modules/home/home_module.dart';
import 'package:segunda_prova/app/modules/home/subpages/create/create_repository.dart';

class CreatePage extends StatefulWidget{
  final Function onSuccess;

  const CreatePage({Key key, this.onSuccess}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();

}

class _CreatePageState extends State<CreatePage>{
  var binds = HomeModule.to.get<CreateRepository>();

  Controller controller;

  @override
  void didChangeDependencies(){
    controller = Controller();
    // listenResponse = binds.responseOut.listen((data){
    //   if(data == 201){
    //     Timer(Duration(seconds: 1), () {
    //       widget.onSuccess();
    //       Navigator.pop(context);
    //     });
    //   }
    // });
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        centerTitle: true,
      ),
      body: StreamBuilder<int>(
        stream: binds.responseOut,
        builder: (context, snapshot){
          if(snapshot.hasError) return Center(child: Text("${snapshot.error}",style: TextStyle(fontSize: 25),));

          if(snapshot.hasData){
            if(snapshot.data == 0){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              Timer(Duration(seconds: 1), (){
                Navigator.pop(context);
              });
              return Center(child: Text("Inserido com sucesso!",style: TextStyle(fontSize: 25),));
            }
              
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                      key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          onSaved: (value) => binds.title = value,
                          validator: (value) => value.isEmpty ? "O titulo não pode ser nulo" : null,
                          decoration: InputDecoration(labelText: "Title"),
                        ),
                        TextFormField(
                          onSaved: (value) => binds.title = value,
                          validator: (value) => value.isEmpty ? "O titulo não pode ser nulo" : null,
                          maxLines: 3,
                          decoration: InputDecoration(labelText: "Body"),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 32),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                        "Enviar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      if(controller.validade()){
                        binds.PostIn.add(placeholderModel(
                          body: binds.body, title: binds.title, userId: 1));
                      }
                    },
                  ),
                )
              ],
            );
          }
        }),
    );
  }

}

class Controller {
  var formKey = GlobalKey<FormState>();

  bool validade(){
    var form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else
      return false;
  }
}