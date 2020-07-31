import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

import '../../meps_controller.dart';

class TableHeader extends StatefulWidget {
  @override
  _TableHeaderState createState() => _TableHeaderState();
}

class _TableHeaderState extends ModularState<TableHeader, MepsController> {

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
                  dataColumn("Id. Institui.\nOrigem"),
                  dataColumn("Id. Institui.\nDestino"),
                  dataColumn("Data do\nprocessamento"),
                  dataColumn("Id. últi.\nficheiro"),
                  dataColumn("Entidade"),
                  dataColumn("Montante total\ntransações"),
                  dataColumn("Total\ntarifação"),
                  dataColumn("Taxa\nIVA"),
                ],
                rows: controller.mepsHeadersTrailers.map(
                      (name) {
                    return DataRow(
                      cells: [
                        dataCell(name.instituicaoOrigem),
                        dataCell(name.instituicaoDestino),
                        dataCell(name.dataProcessamento),
                        dataCell(name.identificacaoUltimoFicheiro),
                        dataCell(name.entidade),
                        dataCell(name.montanteTotalTransacoes),
                        dataCell(name.totalTarifacao),
                        dataCell(name.taxaIva),
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
