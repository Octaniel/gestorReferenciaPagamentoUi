import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_controller.dart';

import '../../../../widgets/data_table_aeps.dart';

class TableDetail extends StatefulWidget {
  @override
  _TableDetailState createState() => _TableDetailState();
}

class _TableDetailState extends ModularState<TableDetail, AepsController> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.read(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_){
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Entidade"),
                dataColumn("Referencia"),
                dataColumn("Data inicio de pag."),
                dataColumn("Data limite de pag."),
                dataColumn("Montante min."),
                dataColumn("Montante max."),
                dataColumn("Codigo clie."),
                dataColumn("Status"),
              ],
              rows: controller.ficheirodetalheclientes.map(
                    (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.entidade),
                      dataCell(name.referencia),
                      dataCell(name.dataInicioPagamento),
                      dataCell(name.dataLimitePagamento),
                      dataCell(name.montanteMinimo),
                      dataCell(name.montanteMaximo),
                      dataCell(name.codigoCliente),
                      DataCell(
                        Text(name.status == true?'Pago':'Não Pago',
                          style: TextStyle(
                              color: name.status == true? Colors.green: Colors.red
                          ),),
                        showEditIcon: false,
                        placeholder: false,
                      ),
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
