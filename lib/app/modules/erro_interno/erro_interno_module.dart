import 'repositories/erro_interno_repository.dart';
import 'erro_interno_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'pages/erro_interno_page.dart';

class ErroInternoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ErroInternoRepository(Dio())),
        Bind((i) => ErroInternoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ErroInternoPage()),
      ];

  static Inject get to => Inject<ErroInternoModule>.of();
}
