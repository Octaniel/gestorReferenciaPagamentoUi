import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'meps_controller.dart';

class MepsPage extends StatefulWidget {
  final String title;
  const MepsPage({Key key, this.title = "Meps"}) : super(key: key);

  @override
  _MepsPageState createState() => _MepsPageState();
}

class _MepsPageState extends ModularState<MepsPage, MepsController> {
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
