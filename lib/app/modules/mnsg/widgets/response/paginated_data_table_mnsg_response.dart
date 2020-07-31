import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/response/pagina_response.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/response/table_response.dart';

import '../bara_pesquisa_mnsg.dart';

class PaginatedDataTableMnsgResponse extends StatefulWidget {
  @override
  _PaginatedDataTableMnsgResponseState createState() =>
      _PaginatedDataTableMnsgResponseState();
}

class _PaginatedDataTableMnsgResponseState
    extends ModularState<PaginatedDataTableMnsgResponse, MnsgController> {

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
              BaraPesquisaMnsg("Entidade",true),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Column(
                  children: [
                    TableResponse(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    PaginaResponse(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
