import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';

import '../../meps_controller.dart';

class TableHeader extends StatefulWidget {
  @override
  _TableHeaderState createState() => _TableHeaderState();
}

class _TableHeaderState extends ModularState<TableHeader, MepsController> {
  String idFile = "";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.readHeader(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_){
              return DataTable(
                columns: <DataColumn>[
                  dataColumn("Id. Institui.\nOrigem"),
                  dataColumn("Id. Institui.\nDestino"),
                  dataColumn("Data do\nprocessamento"),
                  dataColumn("Entidade"),
                  dataColumn("Montante total\ntransações"),
                  dataColumn("Total\ntarifação"),
                  dataColumn("Taxa\nIVA"),
                  dataColumn(""),
                ],
                rows: controller.mepsHeadersTrailers.map(
                      (name) {
                    return DataRow(
                      cells: [
                        dataCell(name.instituicaoOrigem),
                        dataCell(name.instituicaoDestino),
                        dataCell(name.dataProcessamento),
                        dataCell(name.entidade),
                        dataCell(name.montanteTotalTransacoes),
                        dataCell(name.totalTarifacao),
                        dataCell(name.taxaIva),
                        DataCell(IconButton(
                          icon: Tooltip(
                            message: "Ver o ficheiro",
                            child: FaIcon(
                              FontAwesomeIcons.fileAlt,
                              color: Colors.lightBlue,
                            ),
                          ),
                          onPressed: () {
                            idFile = name.dataProcessamento;
                            controller.readFic(idFile);
                            _showAlert(context);
                          },
                        )),
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

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "MEPS_$idFile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Observer(
              builder: (_) {
                return controller.sts.length > 0
                    ? Container(
                  height: 500,
                  width: 790,
                  child: ListView(
                    shrinkWrap: true,
                    children: controller.sts.map((e) => Text(e)).toList(),
                  ),
                )
                    : CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                );
              },
            ),
          );
        });
  }
}
