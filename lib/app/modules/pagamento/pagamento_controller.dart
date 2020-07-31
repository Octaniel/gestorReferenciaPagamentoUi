import 'dart:ui';

import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/repositories/pagamento_repository.dart';
import 'package:mobx/mobx.dart';

import 'modules/pagamento_resumo.dart';

part 'pagamento_controller.g.dart';

class PagamentoController = _PagamentoControllerBase with _$PagamentoController;

abstract class _PagamentoControllerBase with Store {
  final PagamentoRepository repository;

  _PagamentoControllerBase(this.repository);

  @observable
  int currentIndex = 0;

  @observable
  Size size;

  @observable
  String dados = "";

  @observable
  int page = 1;

  @observable
  int qpagina = 0;

  @observable
  ObservableList<PagamentoResumo> pagamentoResumo;

  @action
  setPage(int v) {
    page = v;
  }

  @action
  setQpagina(int value) =>qpagina = value;

  @action
  Future<List> read()async{
    var js = await repository.read(page-1,dados);
    pagamentoResumo = js.elementAt(0);
    setQpagina(js.elementAt(1));
    return js;
  }

}
