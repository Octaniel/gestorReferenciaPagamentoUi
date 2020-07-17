import 'repositories/mnsg_repository.dart';
import 'mnsg_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'mnsg_page.dart';

class MnsgModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MnsgController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MnsgPage()),
      ];

  static Inject get to => Inject<MnsgModule>.of();
}
