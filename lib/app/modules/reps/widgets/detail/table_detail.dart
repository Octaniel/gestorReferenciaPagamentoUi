import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/cosnst_methods.dart';
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
            content: Container(
              height: 370,
              width: 665,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Header e Trailer:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  info(
                    "Identificação do Ficheiro: ",
                    100,
                    repsDetailResumo.repsHeaderTrailer.identificacaoFicheiro,
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Quantidades de Guias: ",
                    100,
                    repsDetailResumo.repsHeaderTrailer.numeroRegistoDetalhe,
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Entidade: ",
                    80,
                    repsDetailResumo.repsHeaderTrailer.entidade,
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Data do Armazenamento do ficheiro: ",
                    160,
                    f.format(DateTime.parse(
                        repsDetailResumo.repsHeaderTrailer.dataCria)),
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Data do Processamento Original: ",
                    100,
                    repsDetailResumo
                        .repsHeaderTrailer.dataProcessamentoOriginal,
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Identificação do Ultimo Ficheiro Enviado: ",
                    100,
                    repsDetailResumo
                        .repsHeaderTrailer.identficacaoUltimoFicheiroEnviado,
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Instituição do Destino: ",
                    100,
                    repsDetailResumo.repsHeaderTrailer.instituicaoDestino,
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Intituição da Origem: ",
                    100,
                    repsDetailResumo.repsHeaderTrailer.instituicaoOrigem,
                  ),
                  Divider(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "Resolvido?:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " ${repsDetailResumo.repsHeaderTrailer.resolvido ? 'Sim' : 'Não'}",
                        style: TextStyle(
                            color: repsDetailResumo.repsHeaderTrailer.resolvido
                                ? Colors.greenAccent
                                : Colors.redAccent),
                      )
                    ],
                  ),
                  Divider(
                    height: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Detail:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  info(
                    "Descritivo do Erro: ",
                    260,
                    repsDetailResumo.discritivoErro.trim(),
                  ),
                  Divider(
                    height: 2,
                  ),
                  info(
                    "Codigo do Erro: ",
                    60,
                    repsDetailResumo.codigoErro,
                  ),
                  Divider(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      info(
                        "Registo Rejeitado: ",
                        530,
                        repsDetailResumo.registoRegeitado,
                      ),
                    ],
                  ),
                  Divider(
                    height: 2,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
