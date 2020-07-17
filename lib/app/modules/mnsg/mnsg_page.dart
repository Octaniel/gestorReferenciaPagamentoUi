import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'mnsg_controller.dart';

class MnsgPage extends StatefulWidget {
  final String title;
  const MnsgPage({Key key, this.title = "Mnsg"}) : super(key: key);

  @override
  _MnsgPageState createState() => _MnsgPageState();
}

class _MnsgPageState extends ModularState<MnsgPage, MnsgController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
