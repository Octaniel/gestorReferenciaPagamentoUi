import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_controller.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/data_table_aeps.dart';

class TableHeader extends StatefulWidget {
  @override
  _TableHeaderState createState() => _TableHeaderState();
}

class _TableHeaderState extends ModularState<TableHeader, AepsController> {
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
            final f = new DateFormat('dd/MM/yyyy');
              return DataTable(
                columns: <DataColumn>[
                  dataColumn("Entidade"),
                  dataColumn("Instituição\norigem"),
                  dataColumn("Instituição\ndestino"),
                  dataColumn("Data processamento"),
                  dataColumn("Ultimo ficheiro\nenviado"),
                  dataColumn("Data envio"),
                  dataColumn(""),
                ],
                rows: controller.ficheirHeaderClientes.map(
                      (name) {
                    return DataRow(
                      cells: [
                        dataCell(name.entidade),
                        dataCell(name.instituicaoOrigem),
                        dataCell(name.instituicaoDestino),
                        dataCell(name.dataProcessamento),
                        dataCell(name.ultimoFicheiroEmviado),
                        dataCell(f.format(DateTime.parse(name.dataEnvio))),
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
              "AEPS_$idFile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Observer(
              builder: (_) {
                return controller.sts.length > 0
                    ? Container(
                  height: 500,
                  width: 580,
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
