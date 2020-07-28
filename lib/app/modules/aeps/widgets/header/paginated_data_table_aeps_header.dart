import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/bara_pesquisa_aeps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/header/pagina_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/header/table_header.dart';

import '../../aeps_controller.dart';

class PaginatedDataTableAepsHeader extends StatefulWidget {
  @override
  _PaginatedDataTableAepsHeaderState createState() =>
      _PaginatedDataTableAepsHeaderState();
}

class _PaginatedDataTableAepsHeaderState
    extends ModularState<PaginatedDataTableAepsHeader, AepsController> {

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
              BaraPesquisaAeps("Entidade",true),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Column(
                  children: [
                    TableHeader(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    PaginaHeader(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
