import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/app_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/app_bar.dart';

import '../../../widgets/bot_nav_bar.dart';

class BodyHome extends StatefulWidget {
  @override
  _BodyHomeState createState() => _BodyHomeState();
}
Size size;

AppController ap = Modular.get();

class _BodyHomeState extends ModularState<BodyHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        AppBarG(),
        _body(),
        Spacer(flex: 330,),
        BotNavBar(),
      ],
    );
  }

  _body(){
    return Container(
        color: Colors.blue,
        width: !ap.isDrawer
            ? size.width
            : size.width - (size.width * .15599),
        height: 351,
        child: Stack(
          children: [
            Image.asset(
              "images/background.jpg",
              width: !ap.isDrawer
                  ? size.width
                  : size.width - (size.width * .15599),
              height: 351,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                "A Entidade Gestora da Rede disponibiliza às Instituições participantes da rede diversos tipos de\n" +
                    "serviços, entre os quais serviços para que as Empresas clientes destas possam receber\n" +
                    "pagamentos por via eletrónica.",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ));
  }
}
