import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/pagamento_controller.dart';

class Pagina extends StatefulWidget {
  @override
  _PaginaState createState() => _PaginaState();
}

class _PaginaState extends ModularState<Pagina, PagamentoController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.pagamentoResumo != null && controller.qpagina > 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: controller.page > 1
                      ? () {
                          controller.setPage(1);
                          controller.read();
                        }
                      : null,
                  child: FaIcon(
                    FontAwesomeIcons.angleDoubleLeft,
                    color: controller.page == 1
                        ? Colors.black87.withOpacity(.5)
                        : Colors.black87,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                InkWell(
                  onTap: controller.page > 1
                      ? () {
                          controller.setPage(controller.page - 1);
                          controller.read();
                        }
                      : null,
                  child: FaIcon(
                    FontAwesomeIcons.angleLeft,
                    color: controller.page == 1
                        ? Colors.black87.withOpacity(.5)
                        : Colors.black87,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  height: 25,
                  width: 70,
                  decoration: ShapeDecoration(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                      child:
                          Text("${controller.page} de ${controller.qpagina}")),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                InkWell(
                  onTap: controller.page < controller.qpagina
                      ? () {
                          controller.setPage(controller.page + 1);
                          controller.read();
                        }
                      : null,
                  child: FaIcon(
                    FontAwesomeIcons.angleRight,
                    color: controller.page == controller.qpagina
                        ? Colors.black87.withOpacity(.5)
                        : Colors.black87,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                InkWell(
                  onTap: controller.page < controller.qpagina
                      ? () {
                          controller.setPage(controller.qpagina);
                          controller.read();
                        }
                      : null,
                  child: FaIcon(
                    FontAwesomeIcons.angleDoubleRight,
                    color: controller.page == controller.qpagina
                        ? Colors.black87.withOpacity(.5)
                        : Colors.black87,
                  ),
                ),
              ],
            )
          : controller.pagamentoResumo != null && controller.qpagina == 0
              ? Text("Nenhum  Encontrado")
              : Text("");
    });
  }
}
