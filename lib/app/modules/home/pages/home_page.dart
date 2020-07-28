import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/body_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/drawer_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

import '../home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   controller.size = MediaQuery.of(context).size;
    controller.isDrawer = true;
    //controller.readErro();
    return Scaffold(
      body: Observer(builder: (_) {
        return SafeArea(
          child: Container(
            color: background,
            height: controller.size.height,
            width: controller.size.width,
            child: Row(
              children: [
                controller.isDrawer ? DrawerHome() : Container(),
                BodyHome(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
