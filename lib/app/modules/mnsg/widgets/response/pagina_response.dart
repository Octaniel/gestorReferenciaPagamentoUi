import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          FlatButton(
            onPressed: controller.pageResponse > 1
                ? () {
              controller.pageResponse = 1;
              controller.readResponse();
            }
                : null,
            child: Icon(
              Icons.arrow_back,
              color: controller.pageResponse == 1
                  ? Colors.black87.withOpacity(.5)
                  : Colors.black87,
            ),
          ),
          FlatButton(
            onPressed: controller.pageResponse > 1
                ? () {
              controller.pageResponse = controller.pageResponse - 1;
              controller.readResponse();
            }
                : null,
            child: Icon(
              Icons.arrow_back_ios,
              color: controller.pageResponse == 1
                  ? Colors.black87.withOpacity(.5)
                  : Colors.black87,
            ),
          ),
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
                child: Text(
                    "${controller.pageResponse} de ${controller.qpaginaResponse}")),
          ),
          FlatButton(
            onPressed: controller.pageResponse < controller.qpaginaResponse
                ? () {
              controller.pageResponse =controller.pageResponse + 1;
              controller.readResponse();
            }
                : null,
            child: Icon(
              Icons.arrow_forward_ios,
              color: controller.pageResponse == controller.qpaginaResponse
                  ? Colors.black87.withOpacity(.5)
                  : Colors.black87,
            ),
          ),
          FlatButton(
            onPressed: controller.pageResponse < controller.qpaginaResponse
                ? () {
              controller.pageResponse =controller.qpaginaResponse;
              controller.readResponse();
            }
                : null,
            child: Icon(
              Icons.arrow_forward,
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
