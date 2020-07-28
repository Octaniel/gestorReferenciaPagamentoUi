import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/bara_pesquisa_reps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/header/pagina_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/header/table_header.dart';

import '../../reps_controller.dart';

class PaginatedDataTableRepsHeader extends StatefulWidget {
  @override
  _PaginatedDataTableRepsHeaderState createState() =>
      _PaginatedDataTableRepsHeaderState();
}

class _PaginatedDataTableRepsHeaderState
    extends ModularState<PaginatedDataTableRepsHeader, RepsController> {
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
              BaraPesquisaReps("Entidade", true),
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
