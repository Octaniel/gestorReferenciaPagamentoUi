import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

import '../meps_controller.dart';

class BaraPesquisaMeps extends StatefulWidget {
  final String text;
  final bool header;
  BaraPesquisaMeps(this.text,this.header);
  @override
  _BaraPesquisaMepsState createState() => _BaraPesquisaMepsState();
}

class _BaraPesquisaMepsState
    extends ModularState<BaraPesquisaMeps, MepsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            "${widget.text}:",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          ),
          Padding(padding: EdgeInsets.only(left: 3)),
          Container(
            width: 300,
            height: 40,
            child: TextField(
              onSubmitted: (v) {
                controller.dados = v;
               widget.header? controller.readHeader():controller.readDetail();
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5),
                  prefixIcon: Container(
                    margin: EdgeInsets.only(top: 5, left: 5),
                    child: FaIcon(FontAwesomeIcons.search),
                  ),
                  hintText: "${widget.text} para pesquisa",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}
