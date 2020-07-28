import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../meps_controller.dart';

class PaginaDetail extends StatefulWidget {
  @override
  _PaginaDetailState createState() => _PaginaDetailState();
}

class _PaginaDetailState extends ModularState<PaginaDetail, MepsController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.mepsDetailsResumo != null && controller.qpagina > 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: controller.page > 1
                      ? () {
                          controller.setPage(1);
                          controller.readDetail();
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
                          controller.readDetail();
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
                  height: 30,
                  width: 80,
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
                          controller.readDetail();
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
                          controller.readDetail();
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
          : controller.mepsDetailsResumo != null && controller.qpagina == 0
              ? Text("Nenhum Detail Encontrado")
              : Text("");
    });
  }
}
