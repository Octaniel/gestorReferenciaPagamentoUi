import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/models/ficheiro_detalhe_cliente.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/cosnst_methods.dart';
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
    final f1 = new DateFormat('dd/MM/yyyy');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                height: 400,
                width: 320,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Divider(height: 2,),
                    Text(
                      "Header e Trailer:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    info(
                      "Instituição Origem: ",
                      80,
                      ficheiroDetalheCliente
                          .ficheiroHeaderCliente.instituicaoOrigem,
                    ),
                    Divider(height: 2,),
                    info(
                      "Instituição Destino: ",
                      80,
                      ficheiroDetalheCliente
                          .ficheiroHeaderCliente.instituicaoDestino,
                    ),
                    Divider(height: 2,),
                    info(
                      "Data do Processamento: ",
                      100,
                      ficheiroDetalheCliente
                          .ficheiroHeaderCliente.dataProcessamento,
                    ),
                    Divider(height: 2,),
                    info(
                      "Ultimo Ficheiro Enviado: ",
                      100,
                      ficheiroDetalheCliente.ficheiroHeaderCliente
                          .ultimoFicheiroEmviado,
                    ),
                    Divider(height: 2,),
                    info(
                      "Entidade: ",
                      60,
                      ficheiroDetalheCliente
                          .ficheiroHeaderCliente.entidade,
                    ),
                    Divider(height: 2,),
                    info(
                      "Data do Envio: ",
                      100,
                      f1.format(DateTime.parse(
                          ficheiroDetalheCliente
                              .ficheiroHeaderCliente.dataEnvio)),
                    ),
                    Divider(height: 2,),
                    info(
                      "Id Por Dia: ",
                      20,
                      ficheiroDetalheCliente
                          .ficheiroHeaderCliente.idPorDia
                          .toString(),
                    ),
                    Divider(height: 2,),
                    SizedBox(height: 10,),
                    Text(
                      "Detail:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    info(
                      "Referencia: ",
                      90,
                      ficheiroDetalheCliente.referencia,
                    ),
                    Divider(height: 2,),
                    info(
                      "Data Limite do Pagamento: ",
                      80,
                      ficheiroDetalheCliente.dataLimitePagamento,
                    ),
                    Divider(height: 2,),
                    info(
                      "Montante Maximo: ",
                      130,
                      ficheiroDetalheCliente.montanteMaximo,
                    ),
                    Divider(height: 2,),
                    info(
                      "Data Inicio do Pagamento: ",
                      80,
                      ficheiroDetalheCliente.dataInicioPagamento,
                    ),
                    Divider(height: 2,),
                    info(
                      "Montante Minimo: ",
                      130,
                      ficheiroDetalheCliente.montanteMinimo,
                    ),
                    Divider(height: 2,),
                    info(
                      "Codigo Cliente: ",
                      130,
                      ficheiroDetalheCliente.montanteMinimo
                    ),
                    Divider(height: 2,),
                    Row(
                      children: [
                        Text(
                          "Pago?:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " ${ficheiroDetalheCliente.status ? 'Sim' : 'Não'}",
                          style: TextStyle(
                              color: ficheiroDetalheCliente.status
                                  ? Colors.greenAccent
                                  : Colors.redAccent),
                        )
                      ],
                    ),
                    Divider(height: 2,),
                    info(
                      "Data do Registro: ",
                      160,
                      f.format(DateTime.parse(ficheiroDetalheCliente.dataCria)),
                    ),
                    Divider(height: 2,),
                  ],
                ),
              ),
          );
        });
  }
}
