import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

import '../../mnsg_controller.dart';

class TableRequest extends StatefulWidget {
  @override
  _TableRequestState createState() => _TableRequestState();
}

class _TableRequestState extends ModularState<TableRequest, MnsgController> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.read(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_){
            final f = new DateFormat('dd/MM/yyyy hh:mm:ss');
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Montante\nPago"),
                dataColumn("Referência"),
                dataColumn("Aplic\nPDD"),
                dataColumn("Código da\nMensagem"),
                dataColumn("Data da\ntransação\ncliente"),
                dataColumn("Hora do\nmovimento"),
                dataColumn("Nr. Entid."),
                dataColumn("Data do\nregisto"),
              ],
              rows: controller.mensagensRealTimeResumo.map(
                    (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.montantePago),
                      dataCell(name.referencia),
                      dataCell(name.aplicacaoPdd),
                      dataCell(name.codigoMenssagem),
                      dataCell(name.dataTransacaoCliente),
                      dataCell(name.horaMovimento),
                      dataCell(name.nrEntidade),
                      dataCell(f.format(DateTime.parse(name.dataHora))),
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
