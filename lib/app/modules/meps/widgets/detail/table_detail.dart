import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_detail.dart';
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
          return Observer(builder: (_) {
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Identificação\nLog EGR"),
                dataColumn("Data / hora\ntransação\ncliente"),
                dataColumn("Montante\npago"),
                dataColumn("Ident. da\ntransação"),
                dataColumn("Cod. Resp.\nda empr."),
                dataColumn("Nr. Identi.\nresposta"),
                dataColumn("Referên.\ndo paga."),
                dataColumn(""),
              ],
              rows: controller.mepsDetailsResumo.map(
                (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.identificacaoEgr),
                      dataCell(name.dataHoraTransacaoCliente),
                      dataCell(name.montantePago),
                      dataCell(name.identificacaoTransacao),
                      dataCell(name.codigoRespostaEmpresa +
                          "                                                 "),
                      dataCell(name.numeroIdentificacaoResposta +
                          "                                           "),
                      dataCell(name.referenciaPagamento),
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

  void _showAlert(BuildContext context, MepsDetail mepsDetail) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Observer(builder: (_) {
              return Container(
                height: controller.more ? 540 : 330,
                width: 380,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Detail:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Referencia: ${mepsDetail.identificacaoEgr}"),
                    Text("Data Limite do Pagamento: ${mepsDetail.numeroEgr}"),
                    Text(
                        "Montante Maximo: ${mepsDetail.dataHoraTransacaoCliente}"),
                    Text(
                        "Data Inicio do Pagamento: ${mepsDetail.montantePago}"),
                    Text("Montante Minimo: ${mepsDetail.tarifa}"),
                    Text("Codigo Cliente: ${mepsDetail.tipoTerminal}"),
                    Text(
                        "Identificação do Terminal: ${mepsDetail.identificacaoTerminal}"),
                    Text(
                        "Identificação da Transação: ${mepsDetail.identificacaoTransacao}"),
                    Text(
                        "Localidade do Terminal: ${mepsDetail.localidadeTerminal}"),
                    Text(
                        "Modo Envio da Comunicação: ${mepsDetail.modoEnvioComunicacao}"),
                    Text(
                        "Codigo da Resposta da Empresa: ${mepsDetail.codigoRespostaEmpresa}"),
                    Text(
                        "Número da Identificação da Resposta: ${mepsDetail.numeroIdentificacaoResposta}"),
                    Text(
                        "Referencia do Pagamento: ${mepsDetail.referenciaPagamento}"),
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
                            onTap: () {
                              controller.more = !controller.more;
                              print(controller.more);
                            },
                            child: !controller.more
                                ? FaIcon(FontAwesomeIcons.angleDown)
                                : FaIcon(FontAwesomeIcons.angleUp),
                          ),
                        ),
                      ],
                    ),
                    controller.more
                        ? Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Instituição Origem: ${mepsDetail.headerMeps.instituicaoOrigem}"),
                                Text(
                                    "Instituição Destino: ${mepsDetail.headerMeps.instituicaoDestino}"),
                                Text(
                                    "Data do Processamento: ${mepsDetail.headerMeps.dataProcessamento}"),
                                Text(
                                    " Identificação do Ultimo Ficheiro Enviado: ${mepsDetail.headerMeps.identificacaoUltimoFicheiro}"),
                                Text(
                                    "Entidade: ${mepsDetail.headerMeps.entidade}"),
                                Text(
                                    "Taxa da Iva: ${mepsDetail.headerMeps.taxaIva}"),
                                Text(
                                    "Montante Total da Transações: ${mepsDetail.headerMeps.montanteTotalTransacoes}"),
                                Text(
                                    "Total da Tarifação: ${mepsDetail.headerMeps.totalTarifacao}"),
                                Text(
                                    "Codigo da Moeda: ${mepsDetail.headerMeps.codigoMoeda}"),
                                Text(
                                    "Iva: ${mepsDetail.headerMeps.iva}"),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            }),
          );
        });
  }
}
