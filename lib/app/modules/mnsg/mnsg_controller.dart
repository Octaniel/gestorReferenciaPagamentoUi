import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/models/mensagem_real_time_response_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/repositories/mnsg_repository.dart';
import 'package:mobx/mobx.dart';

import 'models/mensagem_real_time_resumo.dart';

part 'mnsg_controller.g.dart';

class MnsgController = _MnsgControllerBase with _$MnsgController;

abstract class _MnsgControllerBase with Store {

  final repository = MnsgRepository();

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
  int pageResponse = 1;

  @observable
  int qpaginaResponse = 1;

  @observable
  int qpagina = 0;

  @observable
  ObservableList<MensagemRealTimeResumo> mensagensRealTimeResumo;

  @observable
  ObservableList<MensagemRealTimeResponseResumo> mensagensRealTimeResponseResumo;

  @action
  setPage(int v) {
    page = v;
  }

  @action
  setQpagina(int value) =>qpagina = value;

  @action
  Future<List> read()async{
    var js = await repository.read(page-1,dados);
    mensagensRealTimeResumo = js.elementAt(0);
    setQpagina(js.elementAt(1));
    return js;
  }

  @action
  Future<List> readResponse()async{
    var js = await repository.readResponse(page-1,dados);
    mensagensRealTimeResponseResumo = js.elementAt(0);
    qpaginaResponse = js.elementAt(1);
    return js;
  }

}
