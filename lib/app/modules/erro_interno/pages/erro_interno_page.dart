import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/erro_interno/erro_interno_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/models/erro_interno.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/app_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/bot_nav_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/drawer.dart';

import '../../../app_controller.dart';

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
  AppController ap = Modular.get();
  Size size;
  HomeController hc = Modular.get();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Observer(builder: (_) {
        return SafeArea(
          child: Container(
            color: background,
            height: size.height,
            width: size.width,
            child: Row(
              children: [
                ap.isDrawer ? DrawerG() : Container(),
                Column(
                  children: [
                    AppBarG(),
                    Container(
                      margin: EdgeInsets.only(
                        left: (size.width * .6) / 2 + 270,
                      ),
                      child: FlatButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          hc.atualizarTodosParatrue();
                        },
                        child: Text(
                          "Marcar todos como lido",
                          style: TextStyle(
                              color: Color(0xFF18A1DE),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    _body(),
                    Spacer(
                      flex: 330,
                    ),
                    BotNavBar(),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  _body() {
    return FutureBuilder<List>(
        future: controller.readErro(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return Container(
              height: size.height - 148,
              width: size.width * .6 + 11,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Observer(builder: (_) {
                return ListView(
                    children: hc.errosInterno.map((element) {
                  return InkWell(
                    onTap: (){
                      hc.atualizarParatrue(element.id);
                    },
                    child: _notifi(element),
                  );
                }).toList());
              }),
            );
          }
        });
  }

  Widget _notifi(ErroInterno element) {
    return Container(
      width: size.width * .6 + 11,
      height: 50,
      decoration: ShapeDecoration(
          color: !element.visto ? Color(0xFFF2F9F8) : Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFCCCACA), width: .5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Erro: ",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${element.mensagem} ",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "no ficheiro: ",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${element.nomeFicheiro}",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "2020/07/27 09:16:15",
              style: TextStyle(
                color: textColor.withOpacity(.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
