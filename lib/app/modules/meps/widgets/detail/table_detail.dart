import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';

import '../../meps_controller.dart';

class TableDetail extends StatefulWidget {
  @override
  _TableDetailState createState() => _TableDetailState();
}

class _TableDetailState extends ModularState<TableDetail, MepsController> {

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
                dataColumn("Identificação\nLog EGR"),
                dataColumn("Data / hora\ntransação cliente"),
                dataColumn("Montante pago"),
                dataColumn("Identificação\nda transação"),
                dataColumn("Modo de envio\nda comunicação"),
                dataColumn("Cod. Resposta\nda empresa"),
                dataColumn("Nr. Identificação\nresposta"),
                dataColumn("Referência\ndo pagamento"),
              ],
              rows: controller.mepsDetailsResumo.map(
                    (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.identificacaoEgr),
                      dataCell(name.dataHoraTransacaoCliente),
                      dataCell(name.montantePago),
                      dataCell(name.identificacaoTransacao),
                      dataCell(name.modoEnvioComunicacao),
                      dataCell(name.codigoRespostaEmpresa),
                      dataCell(name.numeroIdentificacaoResposta),
                      dataCell(name.referenciaPagamento),
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
