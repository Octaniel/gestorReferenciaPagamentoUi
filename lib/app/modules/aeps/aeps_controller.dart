import 'package:flutter/cupertino.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/repositories/aeps_repository.dart';
import 'package:mobx/mobx.dart';

import 'models/FicheiroDetalheClienteResumo.dart';
import 'models/FicheiroHeaderCliente.dart';

part 'aeps_controller.g.dart';

class AepsController = _AepsControllerBase with _$AepsController;

abstract class _AepsControllerBase with Store {

  final repository = AepsRepository();

  @observable
  int currentIndex = 0;

  @observable
  Size size;

  @observable
  PageController pageController;

  @observable
  String dados = "";

  @observable
  int page = 1;

  @observable
  int pageHeader = 1;

  @observable
  int qpaginaHeader = 1;

  @observable
  int qpagina = 0;

  @observable
  ObservableList<FicheiroDetalheClienteResumo> ficheirodetalheclientes;

  @observable
  ObservableList<FicheiroHeaderCliente> ficheirHeaderClientes;

  @action
  setPage(int v) {
    page = v;
  }

  @action
  setQpagina(int value) =>qpagina = value;

  @action
  Future<List> read()async{
    var js = await repository.read(page-1,dados);
    ficheirodetalheclientes = js.elementAt(0);
    setQpagina(js.elementAt(1));
    return js;
  }

  @action
  Future<List> readHeader()async{
    var js = await repository.readHeader(pageHeader-1,dados);
    ficheirHeaderClientes = js.elementAt(0);
    qpaginaHeader = js.elementAt(1);
    return js;
  }

}
