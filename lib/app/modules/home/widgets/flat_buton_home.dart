import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

class FlatButonHome extends StatefulWidget {
  final String text;
  final String url;

  const FlatButonHome(this.text, this.url,{Key key}) : super(key: key);
  @override
  _FlatButonHomeState createState() => _FlatButonHomeState();
}

class _FlatButonHomeState extends State<FlatButonHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 25, right: 25),
      child: FlatButton(
        onPressed: () {
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
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 190)),
            Expanded(
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
