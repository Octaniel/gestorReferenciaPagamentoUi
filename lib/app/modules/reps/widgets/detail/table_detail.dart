import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';

class TableDetail extends StatefulWidget {
  @override
  _TableDetailState createState() => _TableDetailState();
}

class _TableDetailState extends ModularState<TableDetail, RepsController> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.readDetail(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_){
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Registo Rejeitado"),
                dataColumn("Código de Erro"),
                dataColumn("Descritivo do Erro"),
                dataColumn("Entidade"),
              ],
              rows: controller.repsDetailsResumo.map(
                    (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.registoRegeitado),
                      dataCell(name.codigoErro),
                      dataCell(name.discritivoErro),
                      dataCell(name.entidadeHeader),
                    ],
                  );
                },
              ).toList(),
            );
          });
        }
      },
    );

  }
}
