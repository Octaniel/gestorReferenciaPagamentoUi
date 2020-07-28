import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/flat_buton_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

class DrawerHome extends StatefulWidget {
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends ModularState<DrawerHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width / 4,
      color: primaryColor,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 8)),
          Text(
            "Menu",
            style: TextStyle(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12)),
          Divider(height: 1),
          Padding(padding: EdgeInsets.only(top: 10)),
          FlatButonHome("AEPS", "/aeps"),
          Padding(padding: EdgeInsets.only(top: 15)),
          FlatButonHome("REPS", "/reps"),
          Padding(padding: EdgeInsets.only(top: 15)),
          FlatButonHome("MEPS", "/meps"),
          Padding(padding: EdgeInsets.only(top: 15)),
          FlatButonHome("MGRT", "/mnsg"),
          Padding(padding: EdgeInsets.only(top: 342)),
          Divider(height: 1),
          FlatButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  "Sair",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 240)),
                Expanded(
                  child: FaIcon(
                    FontAwesomeIcons.powerOff,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
