import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/bara_pesquisa_mnsg.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/request/pagina_request.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/request/table_request.dart';

class PaginatedDataTableMnsgRequest extends StatefulWidget {
  @override
  _PaginatedDataTableMnsgRequestState createState() =>
      _PaginatedDataTableMnsgRequestState();
}

class _PaginatedDataTableMnsgRequestState
    extends ModularState<PaginatedDataTableMnsgRequest, MnsgController> {

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
              BaraPesquisaMnsg("Referencia",false),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Column(
                  children: [
                    TableRequest(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    PaginaRequest(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
