import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/pagamento_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

class TableP extends StatefulWidget {
  @override
  _TableState createState() => _TableState();
}

class _TableState extends ModularState<TableP, PagamentoController> {

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
                dataColumn("Referência"),
                dataColumn("Data da Inserção"),
                dataColumn("Data da Inserção\nda Mensagem"),
                dataColumn("Nome do Ficheiro\nde Movimentos"),
                dataColumn("Valor do Pagamento"),
              ],
              rows: controller.pagamentoResumo.map(
                    (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.referencia),
                      dataCell(name.data),
                      dataCell(name.dataInsercaoMensagem!=null?
                      f.format(DateTime.parse(name.dataInsercaoMensagem)):"Não foi por mensagem"),
                      dataCell(name.nomeFicheiroMeps.isEmpty||name.nomeFicheiroMeps==null?
                      "Não foi por ficheiro":name.nomeFicheiroMeps),
                      dataCell("${name.valor}")
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
