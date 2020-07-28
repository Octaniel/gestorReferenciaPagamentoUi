import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

class BotNavBarHome extends StatefulWidget {
  @override
  _BotNavBarHomeState createState() => _BotNavBarHomeState();
}

class _BotNavBarHomeState extends ModularState<BotNavBarHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: controller.isDrawer ? controller.size.width * .75 : controller.size.width,
      color: primaryColor,
      child: Center(
        child: Text(
          "© Copyright SIBYSDISTP Versão 0.1-2020 - Ministério do "
              "Planeamento, Finanças e Economia Azul. Todos os direitos reservados.",
          style: TextStyle(fontSize: 12, color: textColor),
        ),
      ),
    );
  }
}
