import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/flat_buton.dart';

class DrawerG extends StatefulWidget {
  @override
  _DrawerGState createState() => _DrawerGState();
}

class _DrawerGState extends State<DrawerG> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 135, maxWidth: 213),
      child: Container(
        height: size.height,
        width: size.width * .15599,
        color: primaryColor,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(
                  "Menu",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(flex: 5,),
                Tooltip(
                  message: "Voltar a tela inicial",
                  child: IconButton(icon: FaIcon(FontAwesomeIcons.home), onPressed: (){
                    Modular.to.pushNamed("/");
                  }),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 12)),
            Divider(height: 1),
            Padding(padding: EdgeInsets.only(top: 10)),
            FlatButon("AEPS", "/aeps","Ficheiro de Clientes"),
            Padding(padding: EdgeInsets.only(top: 15)),
            FlatButon("REPS", "/reps", "Ficheiro de Retorno"),
            Padding(padding: EdgeInsets.only(top: 15)),
            FlatButon("MEPS", "/meps", "Ficheiro de Movimentos"),
            Padding(padding: EdgeInsets.only(top: 15)),
            FlatButon("MGRT", "/mnsg", "Mensagem de Real-Time"),
            Spacer(flex: 330,),
            Divider(height: 1),
            Tooltip(
              message: "Fazer logout!",
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Sair",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      child: FaIcon(
                        FontAwesomeIcons.powerOff,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
