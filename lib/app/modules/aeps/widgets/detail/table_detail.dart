import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/models/ficheiro_detalhe_cliente.dart';
import 'package:intl/intl.dart';

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
          return Observer(builder: (_) {
            return DataTable(
              columns: <DataColumn>[
                dataColumn("Referencia"),
                dataColumn("Data inicio\nde pag."),
                dataColumn("Data limite\nde pag."),
                dataColumn("Montante\nminimo"),
                dataColumn("Montante\nmaximo"),
                dataColumn("Status"),
                dataColumn(""),
              ],
              rows: controller.ficheirodetalheclientes.map(
                (name) {
                  return DataRow(
                    cells: [
                      dataCell(name.referencia),
                      dataCell(name.dataInicioPagamento),
                      dataCell(name.dataLimitePagamento),
                      dataCell(name.montanteMinimo),
                      dataCell(name.montanteMaximo),
                      DataCell(
                        Text(
                          name.status == true ? 'Pago' : 'Não Pago',
                          style: TextStyle(
                              color: name.status == true
                                  ? Colors.green
                                  : Colors.red),
                        ),
                        showEditIcon: false,
                        placeholder: false,
                      ),
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

  void _showAlert(
      BuildContext context, FicheiroDetalheCliente ficheiroDetalheCliente) {
    final f = new DateFormat('dd/MM/yyyy hh:mm:ss');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Observer(builder: (_) {
              return Container(
                height: controller.more ? 370 : 220,
                width: 300,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Detail:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Referencia: ${ficheiroDetalheCliente.referencia}"),
                    Text(
                        "Data Limite do Pagamento: ${ficheiroDetalheCliente.dataLimitePagamento}"),
                    Text(
                        "Montante Maximo: ${ficheiroDetalheCliente.montanteMaximo}"),
                    Text(
                        "Data Inicio do Pagamento: ${ficheiroDetalheCliente.dataInicioPagamento}"),
                    Text(
                        "Montante Minimo: ${ficheiroDetalheCliente.montanteMinimo}"),
                    Text(
                        "Codigo Cliente: ${ficheiroDetalheCliente.codigoCliente}"),
                    Row(
                      children: [
                        Text("Pago?:"),
                        Text(
                          " ${ficheiroDetalheCliente.status ? 'Sim' : 'Não'}",
                          style: TextStyle(
                              color: ficheiroDetalheCliente.status
                                  ? Colors.greenAccent
                                  : Colors.redAccent),
                        )
                      ],
                    ),
                    Text(
                        "Data do Registro: ${f.format(DateTime.parse(ficheiroDetalheCliente.dataCria))}"),
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
                                    "Instituição Origem: ${ficheiroDetalheCliente.ficheiroHeaderCliente.instituicaoOrigem}"),
                                Text(
                                    "Instituição Destino: ${ficheiroDetalheCliente.ficheiroHeaderCliente.instituicaoDestino}"),
                                Text(
                                    "Data do Processamento: ${ficheiroDetalheCliente.ficheiroHeaderCliente.dataProcessamento}"),
                                Text(
                                    "Ultimo Ficheiro Enviado: ${ficheiroDetalheCliente.ficheiroHeaderCliente.ultimoFicheiroEmviado}"),
                                Text(
                                    "Entidade: ${ficheiroDetalheCliente.ficheiroHeaderCliente.entidade}"),
                                Text(
                                    "Data do Envio: ${ficheiroDetalheCliente.ficheiroHeaderCliente.dataEnvio}"),
                                Text(
                                    "Id Por Dia: ${ficheiroDetalheCliente.ficheiroHeaderCliente.idPorDia}"),
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
