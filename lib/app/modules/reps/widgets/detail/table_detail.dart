import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/data_table_aeps.dart';
import 'package:intl/intl.dart';

class TableDetail extends StatefulWidget {
  @override
  _TableDetailState createState() => _TableDetailState();
}

class _TableDetailState extends ModularState<TableDetail, RepsController> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.readDetail(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          return Observer(builder: (_) {
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Registo Rejeitado"),
                dataColumn("Código\nde Erro"),
                dataColumn("Descritivo\ndo Erro"),
                dataColumn(""),
              ],
              rows: controller.repsDetails.map(
                (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.registoRegeitado),
                      dataCell(name.codigoErro +
                          "                                        "),
                      dataCell(name.discritivoErro),
                      DataCell(
                        Tooltip(
                          message: "Detalhe",
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.eye,
                              color: Colors.lightBlue,
                            ),
                            onPressed: () {
                              _showAlert(context, name);
                            },
                          ),
                        ),
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

  void _showAlert(BuildContext context, RepsDetail repsDetailResumo) {
    final f = new DateFormat('dd/MM/yyyy hh:mm:ss');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Observer(builder: (_){
              return Container(
                height: controller.more?330:115,
                width: 700,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Detail:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Descritivo do Erro: ${repsDetailResumo.discritivoErro}"),
                    Text("Codigo do Erro: ${repsDetailResumo.codigoErro}"),
                    Text(
                        "Registo Rejeitado: ${repsDetailResumo.registoRegeitado}"),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Header e Trailer:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: 20,
                          child: InkWell(
                            onTap: (){
                              controller.more = !controller.more;
                              print(controller.more);
                            },
                            child: !controller.more?FaIcon(FontAwesomeIcons.angleDown):FaIcon(FontAwesomeIcons.angleUp),
                          ),
                        ),
                      ],
                    ),
                    controller.more? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Identificação do Ficheiro: ${repsDetailResumo.repsHeaderTrailer.identificacaoFicheiro}"),
                          Text(
                              "Quantidades de Guias: ${repsDetailResumo.repsHeaderTrailer.numeroRegistoDetalhe}"),
                          Text(
                              "Entidade: ${repsDetailResumo.repsHeaderTrailer.entidade}"),
                          Text(
                              "Data do Armazenamento do ficheiro: ${f.format(DateTime.parse(repsDetailResumo.repsHeaderTrailer.dataCria))}"),
                          Text(
                              "Data do Processamento Original: ${repsDetailResumo.repsHeaderTrailer.dataProcessamentoOriginal}"),
                          Text(
                              "Identificação do Ultimo Ficheiro Enviado: ${repsDetailResumo.repsHeaderTrailer.identficacaoUltimoFicheiroEnviado}"),
                          Text(
                              "Instituição do Destino: ${repsDetailResumo.repsHeaderTrailer.instituicaoDestino}"),
                          Text(
                              "Intituição da Origem: ${repsDetailResumo.repsHeaderTrailer.instituicaoOrigem}"),
                          Row(
                            children: [
                              Text("Resolvido?:"),
                              Text(
                                " ${repsDetailResumo.repsHeaderTrailer.resolvido ? 'Sim' : 'Não'}",
                                style: TextStyle(
                                    color: repsDetailResumo.repsHeaderTrailer.resolvido
                                        ? Colors.greenAccent
                                        : Colors.redAccent),
                              )
                            ],
                          ),
                        ],
                      ),
                    ):Container(),
                  ],
                ),
              );
            }),
          );
        });
  }
}
