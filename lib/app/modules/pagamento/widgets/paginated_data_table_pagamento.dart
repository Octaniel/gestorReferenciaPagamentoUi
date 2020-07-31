import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/pagamento_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/bara_pesquisa_pagamento.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/pagina.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/table.dart';

class PaginatedDataTablePagamento extends StatefulWidget {
  @override
  _PaginatedDataTablePagamentoState createState() =>
      _PaginatedDataTablePagamentoState();
}

class _PaginatedDataTablePagamentoState
    extends ModularState<PaginatedDataTablePagamento, PagamentoController> {

  @override
  void initState() {
    controller.dados = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              BaraPesquisaPagamento("Referência"),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Column(
                  children: [
                    TableP(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Pagina(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
