import 'meps_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/meps_page.dart';

class MepsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MepsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MepsPage()),
      ];

  static Inject get to => Inject<MepsModule>.of();
}
