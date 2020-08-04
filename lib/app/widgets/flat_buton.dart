import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

import '../app_controller.dart';

class FlatButon extends StatefulWidget {
  final String text;
  final String url;
  final String toolTipMessage;

  const FlatButon(this.text, this.url, this.toolTipMessage, {Key key})
      : super(key: key);

  @override
  _FlatButonState createState() => _FlatButonState();
}

class _FlatButonState extends ModularState<FlatButon, AppController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Tooltip(
          message: widget.toolTipMessage,
          child: FlatButton(
            onPressed: () {
              controller.url = widget.url;
              Modular.to.pushNamed(widget.url);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Color(0xFF202020).withOpacity(.4))),
            child: Row(
              children: [
                Text(
                  "${widget.text}",
                  style: TextStyle(
                    color:
                    controller.url == widget.url ? Colors.lightBlue : textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: controller.url == widget.url
                        ? Colors.lightBlue
                        : textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
