import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

import '../mnsg_controller.dart';

class BaraPesquisaMnsg extends StatefulWidget {
  final String text;
  final bool response;
  BaraPesquisaMnsg(this.text,this.response);
  @override
  _BaraPesquisaMnsgState createState() => _BaraPesquisaMnsgState();
}

class _BaraPesquisaMnsgState
    extends ModularState<BaraPesquisaMnsg, MnsgController> {
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
               widget.response? controller.readResponse():controller.read();
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
