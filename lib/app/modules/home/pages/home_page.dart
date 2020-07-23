import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/card_home.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/widgets/dropdown.dart';
import 'package:intl/intl.dart';
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.readErro();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2d363b),
          title: Text("Gestor de Referencia de Pagamento"),
          actions: [
            DropDown(_list),
            Padding(padding: EdgeInsets.only(left: 15)),
            Observer(builder: (_) {
              return controller.errosInterno == null ||
                      controller.errosInterno.isEmpty
                  ? IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {},
                    )
                  : Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications_active),
                          onPressed: () {
                            controller.apNot = !controller.apNot;
                          },
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          margin: EdgeInsets.only(top: 10, left: 28),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.red),
                          child: Center(
                            child: Text(
                              "${controller.v > 9 ? '+9' : controller.v}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            }),
            Padding(padding: EdgeInsets.only(left: 10)),
          ],
          elevation: 7,
        ),
        body: Stack(
          children: [
            _safeArea(),
            Observer(builder: (_) {
              final f = DateFormat("dd/MM/yyyy hh:mm:ss");
              return controller.apNot
                  ? AnimatedContainer(
                      margin: EdgeInsets.only(left: size.width * .68),
                      duration: Duration(seconds: 1),
                      height: size.height - AppBar().preferredSize.height,
                      child: Card(
                        elevation: 10,
                        child: ListView(
                          children: controller.errosInterno.map((element) {
                            return Container(
                              height: 70,
                              child: ListTile(
                                subtitle: !element.visto
                                    ? Center(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          height: 18,
                                          width: 38,
                                          decoration: ShapeDecoration(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Novo",
                                              style: TextStyle(
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                title: Text(element.nomeFicheiro),
                                onTap: () {
                                  controller.atualizarParatrue(element.id);
                                },
                                leading: Container(
                                  width: 150,
                                  child: Text(element.mensagem),
                                ),
                                trailing: Container(
                                  width: 75,
                                  child: Text(f.format(
                                      DateTime.parse(element.dataHora))),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : Container();
            }),
          ],
        ));
  }

  _safeArea() {
    return SafeArea(
        child: ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Container(
          height: 157,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(padding: EdgeInsets.only(left: 70)),
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
                "Enviado pela EGR à Empresa de Serviços por forma a informar todos os" +
                    "pagamentos das suas faturas que ocorreram durante o Período Contabilístico" +
                    "Central.",
              ),
              CardHome(
                "images/mnsg.png",
                36,
                35,
                "/mnsg",
                "Mensagens em Real-Time",
                "A mensagem de Real-Time, informando o pagamento efetuado, é enviada pela EGR à Empresa." +
                    "Contudo, o sistema exige também que a empresa envie uma mensagem de resposta à EGR.",
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
