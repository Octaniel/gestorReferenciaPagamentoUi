import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/paginated_data_table_pagamento.dart';
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

  @override
  Widget build(BuildContext context) {
    controller.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d363b),
        title: Text("Pagamentos por Ficheiros e Real Time"),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: PaginatedDataTablePagamento()
    );
  }
}
