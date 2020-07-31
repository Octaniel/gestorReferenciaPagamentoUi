import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/body_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/drawer.dart';

import '../../../app_controller.dart';
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
  AppController ap = Modular.get();

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
   controller.readErro();
    return Scaffold(
      body: Observer(builder: (_) {
        return SafeArea(
          child: Container(
            color: background,
            height: size.height,
            width: size.width,
            child: Row(
              children: [
                ap.isDrawer ? DrawerG() : Container(),
                BodyHome(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
