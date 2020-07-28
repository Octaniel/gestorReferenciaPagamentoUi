import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/bara_pesquisa_aeps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/detail/pagina_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/detail/table_detail.dart';

import '../../aeps_controller.dart';

class PaginatedDataTableAepsDetail extends StatefulWidget {
  @override
  _PaginatedDataTableAepsDetailState createState() =>
      _PaginatedDataTableAepsDetailState();
}

class _PaginatedDataTableAepsDetailState
    extends ModularState<PaginatedDataTableAepsDetail, AepsController> {
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
              BaraPesquisaAeps("Referência",false),
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
