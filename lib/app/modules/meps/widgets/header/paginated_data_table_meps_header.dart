import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/widgets/bara_pesquisa_meps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/widgets/header/pagina_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/widgets/header/table_header.dart';

import '../../meps_controller.dart';

class PaginatedDataTableMepsHeader extends StatefulWidget {
  @override
  _PaginatedDataTableMepsHeaderState createState() =>
      _PaginatedDataTableMepsHeaderState();
}

class _PaginatedDataTableMepsHeaderState
    extends ModularState<PaginatedDataTableMepsHeader, MepsController> {
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
              BaraPesquisaMeps("Entidade", true),
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
