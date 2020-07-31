import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/app_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_controller.dart';

class ButaoNavBarReps extends StatefulWidget {
  @override
  _ButaoNavBarRepsState createState() => _ButaoNavBarRepsState();
}

class _ButaoNavBarRepsState extends ModularState<ButaoNavBarReps,RepsController> {
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
            _flatButao(FontAwesomeIcons.fileAlt, "Details",0),
            Padding(padding: EdgeInsets.only(left: 150)),
            _flatButao(FontAwesomeIcons.fileInvoice, "Headers",1,),
          ],
        ),
      ),
    );
  }

  Widget _flatButao(IconData urlImage, String nome, int index){
    return Observer(builder: (_){
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
    });
  }
}
