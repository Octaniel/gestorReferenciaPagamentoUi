import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/card_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/dropdown.dart';
import '../home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  AnimationController _animationController;
  List<String> _list = [
    "Pagamentos",
  ];

  String _value;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d363b),
        title: Text("Gestor de Referencia de Pagamento"),
        actions: [DropDown(_list, _value)],
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardHome(
                "images/aeps.png",
                36,
                35,
                "/aeps",
                "Ficheiro de Clientes",
                "Deverá ser enviado sempre que haja emissão de faturas\ recibo para os" +
                    "clientes da Empresa de Serviços e para os quais pretenda disponibilizar o" +
                    "pagamento.",
              ),
              CardHome(
                "images/reps.png",
                36,
                35,
                "/reps",
                "Ficheiro de Retorno",
                "O ficheiro de retorno só é gerado se o header do ficheiro original for" +
                    "corretamente desformatado, e após ter sido validada a Entidade que enviou o" +
                    "ficheiro.",
              ),
              CardHome(
                "images/meps.png",
                89.6,
                35,
                "/meps",
                "Ficheiro de Movimentos",
                "Enviado pela EGR à Empresa de Serviços por forma a informar todos os"+
                  "pagamentos das suas faturas que ocorreram durante o Período Contabilístico"+
                  "Central.",
              ),
              CardHome(
                "images/mnsg.png",
                36,
                35,
                "/mnsg",
                "Mensagens em Real-Time",
                "A mensagem de Real-Time, informando o pagamento efetuado, é enviada pela EGR à Empresa."+
                  "Contudo, o sistema exige também que a empresa envie uma mensagem de resposta à EGR.",
              ),
            ],
          ),
        ],
      )),
    );
  }
}
