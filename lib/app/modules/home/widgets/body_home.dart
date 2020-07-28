import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/app_bar_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

import 'bot_nav_bar_home.dart';

class BodyHome extends StatefulWidget {
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends ModularState<BodyHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarHome(),
        Container(
            margin: EdgeInsets.only(bottom: 95),
            width: !controller.isDrawer
                ? controller.size.width
                : controller.size.width - (controller.size.width / 4),
            height: 351,
            child: Stack(
              children: [
                Image.asset(
                  "images/background.jpg",
                  width: !controller.isDrawer
                      ? controller.size.width
                      : controller.size.width - (controller.size.width / 4),
                  height: 351,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Text(
                    "A Entidade Gestora da Rede disponibiliza às Instituições participantes da rede diversos tipos de\n" +
                        "serviços, entre os quais serviços para que as Empresas clientes destas possam receber\n" +
                        "pagamentos por via eletrónica. ",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            )),
        Padding(padding: EdgeInsets.only(top: 112)),
        BotNavBarHome(),
      ],
    );
  }
}
