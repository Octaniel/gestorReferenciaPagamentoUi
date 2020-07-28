import 'package:flutter/material.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 49,
      width: size.width,
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
