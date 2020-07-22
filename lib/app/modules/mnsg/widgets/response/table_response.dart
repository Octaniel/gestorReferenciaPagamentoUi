import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

import '../../mnsg_controller.dart';

class TableResponse extends StatefulWidget {
  @override
  _TableResponseState createState() => _TableResponseState();
}

class _TableResponseState extends ModularState<TableResponse, MnsgController> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.readResponse(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_){
            final f = new DateFormat('dd/MM/yyyy hh:mm:ss');
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Nr. Entidade"),
                dataColumn("Código de\nResposta"),
                dataColumn("Identificação Log"),
                dataColumn("Nº Identificação\nda resposta"),
                dataColumn("Prefixo")
              ],
              rows: controller.mensagensRealTimeResponseResumo.map(
                    (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.nrEntidade),
                      dataCell(name.codigoResposta),
                      dataCell(name.identificacaoLog),
                      dataCell(name.nidentificacaoResposta),
                      dataCell(name.prefix),
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
