import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/paginated_data_table_pagamento.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/app_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/bot_nav_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/drawer.dart';
import '../../../app_controller.dart';
import '../pagamento_controller.dart';

class PagamentoPage extends StatefulWidget {
  final String title;
  const PagamentoPage({Key key, this.title = "Pagamento"}) : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState
    extends ModularState<PagamentoPage, PagamentoController> {
  //use 'controller' variable to access controller
  AppController ap = Modular.get();

  @override
  Widget build(BuildContext context) {
    controller.size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Observer(builder: (_) {
        return SafeArea(
          child: Container(
            color: background,
            height: controller.size.height,
            width: controller.size.width,
            child: Row(
              children: [
                ap.isDrawer ? DrawerG() : Container(),
                Column(
                  children: [
                    AppBarG(),
                    _body(),
                    Spacer(
                      flex: 330,
                    ),
                    BotNavBar(),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  _body() {
    return Container(
      width: !ap.isDrawer
          ? controller.size.width
          : controller.size.width - (controller.size.width * .15599),
      height: controller.size.height - 159,
      child: PaginatedDataTablePagamento(),
    );
  }
}
