import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_controller.dart';

class PaginaHeader extends StatefulWidget {
  @override
  _PaginaHeaderState createState() => _PaginaHeaderState();
}

class _PaginaHeaderState extends ModularState<PaginaHeader, RepsController> {
  @override
  Widget build(BuildContext context) {
   return Observer(builder: (_){
     return controller.repsHeadersTrailers != null && controller.qpaginaHeader>0
         ? Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         InkWell(
           onTap: controller.pageHeader > 1
               ? () {
             controller.pageHeader = 1;
             controller.readHeader();
           }
               : null,
           child: FaIcon(
             FontAwesomeIcons.angleDoubleLeft,
             color: controller.pageHeader == 1
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
         Padding(padding: EdgeInsets.only(left: 10)),
         InkWell(
           onTap: controller.pageHeader > 1
               ? () {
             controller.pageHeader = controller.pageHeader-1;
             controller.readHeader();
           }
               : null,
           child: FaIcon(
             FontAwesomeIcons.angleLeft,
             color: controller.pageHeader == 1
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
         Padding(padding: EdgeInsets.only(left: 10)),
         Container(
           height: 25,
           width: 70,
           decoration: ShapeDecoration(
             color: Colors.blue,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10),
             ),
           ),
           child: Center(
               child: Text(
                   "${controller.pageHeader} de ${controller.qpaginaHeader}")),
         ),
         Padding(padding: EdgeInsets.only(left: 10)),
         InkWell(
           onTap: controller.pageHeader < controller.qpaginaHeader
               ? () {
             controller.pageHeader = controller.pageHeader+1;
             print(controller.pageHeader);
             controller.readHeader();
           }
               : null,
           child: FaIcon(
             FontAwesomeIcons.angleRight,
             color: controller.pageHeader == controller.qpaginaHeader
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
         Padding(padding: EdgeInsets.only(left: 10)),
         InkWell(
           onTap: controller.pageHeader < controller.qpaginaHeader
               ? () {
             controller.pageHeader = controller.qpaginaHeader;
             controller.readHeader();
           }
               : null,
           child: FaIcon(
             FontAwesomeIcons.angleDoubleRight,
             color: controller.pageHeader == controller.qpaginaHeader
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
       ],
     )
         : controller.repsHeadersTrailers != null && controller.qpaginaHeader==0?Text("Nenhum Header Encontrado"): Container();

   });
    }
}
