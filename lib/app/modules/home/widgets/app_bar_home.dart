import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

class AppBarHome extends StatefulWidget {
  @override
  _AppBarHomeState createState() => _AppBarHomeState();
}

class _AppBarHomeState extends ModularState<AppBarHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              controller.isDrawer = !controller.isDrawer;
            },
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: controller.isDrawer ? 340 : 340 + (340 * .55))),
          Text(
            "SIBYSDISTP",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: textColor),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: controller.isDrawer ? 230 : 230 + (230 * .55))),
          RaisedButton(
            onPressed: () {},
            color: Color(0xFF175CD4),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Pagamentos",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: controller.isDrawer ? 40 : 40 + (40 * .55))),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Container(
                width: 13,
                height: 13,
                margin: EdgeInsets.only(left: 25,top: 10),
                decoration: ShapeDecoration(
                  color: Color(0xFF1860DE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
