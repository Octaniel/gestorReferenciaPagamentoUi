import 'aeps_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/aeps_page.dart';

class AepsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AepsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AepsPage()),
      ];

  static Inject get to => Inject<AepsModule>.of();
}
