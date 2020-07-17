import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../aeps_controller.dart';

class PaginaHeader extends StatefulWidget {
  @override
  _PaginaHeaderState createState() => _PaginaHeaderState();
}

class _PaginaHeaderState extends ModularState<PaginaHeader, AepsController> {
  @override
  Widget build(BuildContext context) {
   return Observer(builder: (_){
     return controller.ficheirHeaderClientes != null && controller.qpaginaHeader>0
         ? Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         FlatButton(
           onPressed: controller.pageHeader > 1
               ? () {
             controller.pageHeader = 1;
             controller.readHeader();
           }
               : null,
           child: Icon(
             Icons.arrow_back,
             color: controller.pageHeader == 1
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
         FlatButton(
           onPressed: controller.pageHeader > 1
               ? () {
             controller.pageHeader = controller.pageHeader-1;
             controller.readHeader();
           }
               : null,
           child: Icon(
             Icons.arrow_back_ios,
             color: controller.pageHeader == 1
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
         Container(
           height: 30,
           width: 80,
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
         FlatButton(
           onPressed: controller.pageHeader < controller.qpaginaHeader
               ? () {
             controller.pageHeader = controller.pageHeader+1;
             print(controller.pageHeader);
             controller.readHeader();
           }
               : null,
           child: Icon(
             Icons.arrow_forward_ios,
             color: controller.pageHeader == controller.qpaginaHeader
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
         FlatButton(
           onPressed: controller.pageHeader < controller.qpaginaHeader
               ? () {
             controller.pageHeader = controller.qpaginaHeader;
             controller.readHeader();
           }
               : null,
           child: Icon(
             Icons.arrow_forward,
             color: controller.pageHeader == controller.qpaginaHeader
                 ? Colors.black87.withOpacity(.5)
                 : Colors.black87,
           ),
         ),
       ],
     )
         : controller.ficheirHeaderClientes != null && controller.qpaginaHeader==0?Text("Nenhum Header Encontrado"): Container();

   });
    }
}
