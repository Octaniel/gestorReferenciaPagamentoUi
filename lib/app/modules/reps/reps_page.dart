import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reps_controller.dart';

class RepsPage extends StatefulWidget {
  final String title;
  const RepsPage({Key key, this.title = "Reps"}) : super(key: key);

  @override
  _RepsPageState createState() => _RepsPageState();
}

class _RepsPageState extends ModularState<RepsPage, RepsController> {
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
