import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/detail/pagina_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/detail/table_detail.dart';

import '../../aeps_controller.dart';

class PaginatedDataTableAepsDetail extends StatefulWidget {
  @override
  _PaginatedDataTableAepsDetailState createState() =>
      _PaginatedDataTableAepsDetailState();
}

class _PaginatedDataTableAepsDetailState
    extends ModularState<PaginatedDataTableAepsDetail, AepsController> {

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
                  "Detail",
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
                TableDetail(),
                Padding(padding: EdgeInsets.only(top: 10)),
                PaginaDetail(),
              ],
            ),
          ),
        ));
  }
}
