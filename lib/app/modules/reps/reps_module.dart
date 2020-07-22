import 'reps_controller.dart';
import 'repositories/reps_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/reps_page.dart';

class RepsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RepsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RepsPage()),
      ];

  static Inject get to => Inject<RepsModule>.of();
}
