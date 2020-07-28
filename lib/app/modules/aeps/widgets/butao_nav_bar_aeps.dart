import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_controller.dart';

class ButaoNavBarAeps extends StatefulWidget {
  @override
  _ButaoNavBarAepsState createState() => _ButaoNavBarAepsState();
}

class _ButaoNavBarAepsState
    extends ModularState<ButaoNavBarAeps, AepsController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _flatButao(FontAwesomeIcons.fileAlt, "Details", 0),
          Padding(padding: EdgeInsets.only(left: 137)),
          _flatButao(
            FontAwesomeIcons.fileInvoice,
            "Headers",
            1,
          ),
        ],
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
