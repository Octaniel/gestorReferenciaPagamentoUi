import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../erro_interno_controller.dart';

class ErroInternoPage extends StatefulWidget {
  final String title;
  const ErroInternoPage({Key key, this.title = "ErroInterno"})
      : super(key: key);

  @override
  _ErroInternoPageState createState() => _ErroInternoPageState();
}

class _ErroInternoPageState
    extends ModularState<ErroInternoPage, ErroInternoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d363b),
        title: Text("Erros Internos"),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: Container()
    );
  }
}
