import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/pagamento_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/pagina.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/widgets/table.dart';

class PaginatedDataTablePagamento extends StatefulWidget {
  @override
  _PaginatedDataTablePagamentoState createState() =>
      _PaginatedDataTablePagamentoState();
}

class _PaginatedDataTablePagamentoState
    extends ModularState<PaginatedDataTablePagamento, PagamentoController> {

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
                  "Pagamentos",
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
                TableP(),
                Padding(padding: EdgeInsets.only(top: 10)),
                Pagina(),
              ],
            ),
          ),
        ));
  }
}
