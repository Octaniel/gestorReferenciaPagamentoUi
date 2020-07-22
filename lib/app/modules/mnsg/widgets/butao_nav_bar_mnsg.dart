import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_controller.dart';

class ButaoNavBarMnsg extends StatefulWidget {
  @override
  _ButaoNavBarMnsgState createState() => _ButaoNavBarMnsgState();
}

class _ButaoNavBarMnsgState extends ModularState<ButaoNavBarMnsg,MnsgController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: controller.size.width*.25),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _flatButao("images/details.png", "Details",0),
          Padding(padding: EdgeInsets.only(left: 150)),
          _flatButao("images/header.png", "Headers",1,),
        ],
      ),
    );
  }

  Widget _flatButao(String urlImage, String nome, int index){
    return Observer(builder: (_){
      return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        color:  controller.currentIndex == index?nome=="Headers"?
        Colors.lightBlue.withOpacity(.5):Colors.lightGreen.withOpacity(.5):Colors.transparent,
        onPressed: () {
          controller.currentIndex = index;
          controller.pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        child: Row(
          children: [
            Image.asset(
              urlImage,
              height: 45,
              width: 45,
              color: controller.currentIndex == index?Colors.black87:Colors.black87.withOpacity(.7),
            ),
            controller.currentIndex == index? Text(nome):Text("")
          ],
        ),
      );
    });
  }
}
