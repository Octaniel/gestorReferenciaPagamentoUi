import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/header/pagina_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/header/table_header.dart';

import '../../aeps_controller.dart';

class PaginatedDataTableHeader extends StatefulWidget {
  @override
  _PaginatedDataTableHeaderState createState() =>
      _PaginatedDataTableHeaderState();
}

class _PaginatedDataTableHeaderState
    extends ModularState<PaginatedDataTableHeader, AepsController> {

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
                  "Header",
                  style: TextStyle(fontSize: 32),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    onSubmitted: (v) {
                      controller.dados = v;
                      controller.readHeader();
                    },
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Icon(Icons.search),
                        ),
                        hintText: "Entidade",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                TableHeader(),
                Padding(padding: EdgeInsets.only(top: 10)),
                PaginaHeader(),
              ],
            ),
          ),
        ));
  }
}
