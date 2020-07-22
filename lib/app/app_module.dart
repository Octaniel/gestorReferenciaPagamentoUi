import 'package:dio/dio.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_module.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/meps_module.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/mnsg_module.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/pagamento_module.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/reps_module.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:gestorReferenciaPagamentoUi/app/app_widget.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(
          baseUrl: url
        ))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router("/aeps", module: AepsModule()),
        Router("/reps", module: RepsModule()),
        Router("/meps", module: MepsModule()),
        Router("/mnsg", module: MnsgModule()),
        Router("/pagamento", module: PagamentoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
