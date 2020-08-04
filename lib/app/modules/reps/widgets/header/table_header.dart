import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

import '../../reps_controller.dart';

class TableHeader extends StatefulWidget {
  @override
  _TableHeaderState createState() => _TableHeaderState();
}

class _TableHeaderState extends ModularState<TableHeader, RepsController> {
  String idFile = "";
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.readHeader(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_) {
            final f = new DateFormat('dd/MM/yyyy hh:mm:ss');
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Id. Institui.\nOrigem"),
                dataColumn("Id. Institui.\nDestino"),
                dataColumn("Identificação\nFicheiro"),
                dataColumn("Id. Último\nFicheiro Envi."),
                dataColumn("Entidade"),
                dataColumn("Data Cri."),
                dataColumn(""),
                dataColumn("Resolvido"),
              ],
              rows: controller.repsHeadersTrailers.map(
                (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.instituicaoOrigem +
                          "                                        "),
                      dataCell(name.instituicaoDestino +
                          "                                        "),
                      dataCell(name.identificacaoFicheiro),
                      dataCell(name.identficacaoUltimoFicheiroEnviado +
                          "                                        "),
                      dataCell(name.entidade),
                      dataCell(f.format(DateTime.parse(name.dataCria))),
                      DataCell(IconButton(
                        icon: Tooltip(
                          message: "Ver o ficheiro",
                          child: FaIcon(
                            FontAwesomeIcons.fileAlt,
                            color: Colors.lightBlue,
                          ),
                        ),
                        onPressed: () {
                          idFile = name.identificacaoFicheiro;
                          controller.readFic(idFile);
                          _showAlert(context);
                        },
                      )),
                      DataCell(Tooltip(
                        message: val?"Não foi resolvido":"Já foi resolvido",
                        child: Checkbox(value: name.resolvido, onChanged: (vl){
                          controller.updateResolvido(name.id);
                        }),
                      ))
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
              "REPS_$idFile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Observer(
              builder: (_) {
                return controller.sts.length > 0
                    ? Container(
                        height: 500,
                        width: 1500,
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
