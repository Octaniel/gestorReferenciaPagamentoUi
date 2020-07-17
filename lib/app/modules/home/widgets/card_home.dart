import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';

class CardHome extends StatefulWidget {
  CardHome(
    this._urlImage,
    this._width,
    this._height,
    this._routeName,
    this._nome,
    this._descricao,
  );

  String _urlImage;
  double _width;
  double _height;
  String _routeName;
  String _nome;
  String _descricao;

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends ModularState<CardHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 155,
        width: 300,
        child: Card(
          color: Colors.white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () {
              Modular.to.pushNamed(widget._routeName);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget._urlImage,
                  width: widget._width,
                  height: widget._height,
                  fit: BoxFit.contain,
                ),
                Text(
                  widget._nome,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Text(
                  widget._descricao,
                  style: TextStyle(
                    color: Colors.black87.withOpacity(.5),
                    fontWeight: FontWeight.w100,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
