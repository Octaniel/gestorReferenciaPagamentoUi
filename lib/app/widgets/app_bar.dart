import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/app_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

class AppBarG extends StatefulWidget {
  @override
  _AppBarGState createState() => _AppBarGState();
}

class _AppBarGState extends ModularState<AppBarG, AppController> {
  HomeController hc = Modular.get();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    hc.errosInterno==null?hc.readErro():print("");
    return Container(
      height: 50,
      width: !controller.isDrawer
          ? size.width
          : size.width - (size.width * .15599),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print(controller.isDrawer);
              controller.isDrawer = !controller.isDrawer;
            },
          ),
          Spacer(flex: 25,),
          Text(
            "SIBYSDISTP",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: textColor),
          ),
          Spacer(flex: 18,),
          RaisedButton(
            onPressed: () {
              Modular.to.pushNamed("/pagamento");
            },
            color: Colors.lightBlue,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Pagamentos",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
          Spacer(flex: 2,),
          Stack(
            children: [
              Tooltip(
                message: "Notificações",
                child: IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {
                    Modular.to.pushNamed("/erroInterno");
                  },
                ),
              ),
              Observer(builder: (_){
                return hc.v>0?Container(
                  width: 15,
                  height: 15,
                  margin: EdgeInsets.only(left: 25,top: 10),
                  decoration: ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Center(
                      child: Text(
                        hc.v>9?"+9":hc.v.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ),
                ):Container();
              }),
            ],
          ),
        ],
      ),
    );
  }
}
