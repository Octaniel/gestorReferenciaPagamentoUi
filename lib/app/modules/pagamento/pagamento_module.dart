import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/pages/pagamento_page.dart';
import 'repositories/pagamento_repository.dart';
import 'pagamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PagamentoRepository(i.get())),
        Bind((i) => PagamentoController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PagamentoPage()),
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
