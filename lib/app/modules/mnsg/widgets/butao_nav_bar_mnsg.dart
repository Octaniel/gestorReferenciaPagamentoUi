import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_controller.dart';

import '../../../app_controller.dart';

class ButaoNavBarMnsg extends StatefulWidget {
  @override
  _ButaoNavBarMnsgState createState() => _ButaoNavBarMnsgState();
}

class _ButaoNavBarMnsgState extends ModularState<ButaoNavBarMnsg,MnsgController> {
  AppController ap = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: !ap.isDrawer
          ? controller.size.width
          : controller.size.width - (controller.size.width * .15599),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _flatButao(FontAwesomeIcons.fileAlt, "Request",0),
            Padding(padding: EdgeInsets.only(left: 150)),
            _flatButao(FontAwesomeIcons.fileInvoice, "Response",1),
          ],
        ),
      ),
    );
  }

  Widget _flatButao(IconData urlImage, String nome, int index) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.transparent,
      onPressed: () {
        controller.currentIndex = index;
        controller.pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      child: Container(
        height: 50,
        child: Column(
          children: [
            FaIcon(
              urlImage,
              color: controller.currentIndex == index
                  ? Colors.blue
                  : Colors.black87.withOpacity(.8),
            ),
            Text(
              nome,
              style: TextStyle(
                  color: controller.currentIndex == index
                      ? Colors.blue
                      : Colors.black87.withOpacity(.8)),
            ),
          ],
        ),
      ),
    );
  }
}
