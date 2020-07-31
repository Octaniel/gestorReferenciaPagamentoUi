import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_controller.dart';

class PaginaResponse extends StatefulWidget {
  @override
  _PaginaResponseState createState() => _PaginaResponseState();
}

class _PaginaResponseState extends ModularState<PaginaResponse,MnsgController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return controller.mensagensRealTimeResponseResumo != null && controller.qpaginaResponse>0
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: controller.pageResponse > 1
                ? () {
              controller.pageResponse = 1;
              controller.readResponse();
            }
                : null,
            child: FaIcon(
              FontAwesomeIcons.angleDoubleLeft,
              color: controller.pageResponse == 1
                  ? Colors.black87.withOpacity(.5)
                  : Colors.black87,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          InkWell(
            onTap: controller.pageResponse > 1
                ? () {
              controller.pageResponse = controller.pageResponse - 1;
              controller.readResponse();
            }
                : null,
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: controller.pageResponse == 1
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
                child: Text(
                    "${controller.pageResponse} de ${controller.qpaginaResponse}")),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          InkWell(
            onTap: controller.pageResponse < controller.qpaginaResponse
                ? () {
              controller.pageResponse =controller.pageResponse + 1;
              controller.readResponse();
            }
                : null,
            child: FaIcon(
              FontAwesomeIcons.angleRight,
              color: controller.pageResponse == controller.qpaginaResponse
                  ? Colors.black87.withOpacity(.5)
                  : Colors.black87,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          InkWell(
            onTap: controller.pageResponse < controller.qpaginaResponse
                ? () {
              controller.pageResponse =controller.qpaginaResponse;
              controller.readResponse();
            }
                : null,
            child: FaIcon(
              FontAwesomeIcons.angleDoubleRight,
              color: controller.pageResponse == controller.qpaginaResponse
                  ? Colors.black87.withOpacity(.5)
                  : Colors.black87,
            ),
          ),
        ],
      )
          : controller.mensagensRealTimeResponseResumo != null && controller.qpaginaResponse==0?Text("Nenhum Response Encontrado"): Text("");
    });
   }
}
