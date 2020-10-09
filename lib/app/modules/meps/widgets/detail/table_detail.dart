import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/cosnst_methods.dart';
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
            content: Container(
              height: 585,
              width: 460,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Header e Trailer:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  info(
                    "Instituição Origem: ",
                    100,
                    mepsDetail.headerMeps.instituicaoOrigem,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Instituição Destino: ",
                    100,
                    mepsDetail.headerMeps.instituicaoDestino,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Data do Processamento: ",
                    100,
                    mepsDetail.headerMeps.dataProcessamento,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Identificação do Ultimo Ficheiro Enviado: ",
                    100,
                    mepsDetail.headerMeps.identificacaoUltimoFicheiro,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Entidade: ",
                    100,
                    mepsDetail.headerMeps.entidade,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Taxa da Iva: ",
                    100,
                    mepsDetail.headerMeps.taxaIva,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Montante Total da Transações: ",
                    150,
                    mepsDetail.headerMeps.montanteTotalTransacoes,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Total da Tarifação: ",
                    150,
                    mepsDetail.headerMeps.totalTarifacao,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Codigo da Moeda: ",
                    100,
                    mepsDetail.headerMeps.codigoMoeda,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Iva: ",
                    150,
                    mepsDetail.headerMeps.iva,
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
                    "Referencia: ",
                    100,
                    mepsDetail.identificacaoEgr,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Data Limite do Pagamento: ",
                    100,
                    mepsDetail.numeroEgr,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Montante Maximo: ",
                    150,
                    mepsDetail.dataHoraTransacaoCliente,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Data Inicio do Pagamento: ",
                    150,
                    mepsDetail.montantePago,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Montante Minimo: ",
                    100,
                    mepsDetail.tarifa,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Codigo Cliente: ",
                    100,
                    mepsDetail.tipoTerminal,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Identificação do Terminal: ",
                    100,
                    mepsDetail.identificacaoTerminal,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Identificação da Transação: ",
                    100,
                    mepsDetail.identificacaoTransacao,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Localidade do Terminal: ",
                    100,
                    mepsDetail.localidadeTerminal,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Modo Envio da Comunicação: ",
                    100,
                    mepsDetail.modoEnvioComunicacao,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Codigo da Resposta da Empresa: ",
                    100,
                    mepsDetail.codigoRespostaEmpresa,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Número da Identificação da Resposta: ",
                    100,
                    mepsDetail.numeroIdentificacaoResposta,
                  ),
                  Divider(
                    height: 2,
                  ),info(
                    "Referencia do Pagamento: ",
                    100,
                    mepsDetail.referenciaPagamento,
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
