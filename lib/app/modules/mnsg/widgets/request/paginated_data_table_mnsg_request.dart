import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/request/pagina_request.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/request/table_request.dart';

class PaginatedDataTableMnsgRequest extends StatefulWidget {
  @override
  _PaginatedDataTableMnsgRequestState createState() =>
      _PaginatedDataTableMnsgRequestState();
}

class _PaginatedDataTableMnsgRequestState
    extends ModularState<PaginatedDataTableMnsgRequest, MnsgController> {

  @override
  void initState() {
    controller.dados = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Column(
              children: [
                Text(
                  "Request",
                  style: TextStyle(fontSize: 32),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    onSubmitted: (v) {
                      controller.dados = v;
                      controller.read();
                    },
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Icon(Icons.search),
                        ),
                        hintText: "Referencia",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                TableRequest(),
                Padding(padding: EdgeInsets.only(top: 10)),
                PaginaRequest(),
              ],
            ),
          ),
        ));
  }
}
