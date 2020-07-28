import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/bara_pesquisa_reps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/detail/pagina_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/detail/table_detail.dart';

class PaginatedDataTableRepsDetail extends StatefulWidget {
  @override
  _PaginatedDataTableRepsDetailState createState() =>
      _PaginatedDataTableRepsDetailState();
}

class _PaginatedDataTableRepsDetailState
    extends ModularState<PaginatedDataTableRepsDetail, RepsController> {

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
              BaraPesquisaReps("Código de Erro",false),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Column(
                  children: [
                    TableDetail(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    PaginaDetail(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
