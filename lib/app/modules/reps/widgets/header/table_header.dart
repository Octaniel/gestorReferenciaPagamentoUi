import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

import '../../reps_controller.dart';

class TableHeader extends StatefulWidget {
  @override
  _TableHeaderState createState() => _TableHeaderState();
}

class _TableHeaderState extends ModularState<TableHeader, RepsController> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.readHeader(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_){
            final f = new DateFormat('dd-MM-yyyy hh:mm');
              return DataTable(
                columns: <DataColumn>[
                  dataColumn("Id. Instituição\nOrigem"),
                  dataColumn("Id. Instituição\nDestino"),
                  dataColumn("Identificação\nFicheiro"),
                  dataColumn("Id. Último\nFicheiro Enviado"),
                  dataColumn("Entidade"),
                  dataColumn("Data\nProcessamento Orginal"),
                  dataColumn("Nº Registos\nde Detalhe"),
                  dataColumn("Data Criação"),
                ],
                rows: controller.repsHeadersTrailers.map(
                      (name) {
                    return DataRow(
                      cells: [
                        dataCell(name.instituicaoOrigem),
                        dataCell(name.instituicaoDestino),
                        dataCell(name.identificacaoFicheiro),
                        dataCell(name.identficacaoUltimoFicheiroEnviado),
                        dataCell(name.entidade),
                        dataCell(name.dataProcessamentoOriginal),
                        dataCell("${name.numeroRegistoDetalhe}"),
                        dataCell(f.format(DateTime.parse(name.dataCria))),
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
