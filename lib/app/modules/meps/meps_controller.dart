import 'package:flutter/material.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_detail_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/repositories/meps_repository.dart';
import 'package:mobx/mobx.dart';

import 'models/meps_header_trailer.dart';

part 'meps_controller.g.dart';

class MepsController = _MepsControllerBase with _$MepsController;

abstract class _MepsControllerBase with Store {

  final repository = MepsRepository();

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
  ObservableList<MepsDetailResumo> mepsDetailsResumo;

  @observable
  ObservableList<MepsHeaderTrailer> mepsHeadersTrailers;

  @action
  setPage(int v) {
    page = v;
  }

  @action
  setQpagina(int value) =>qpagina = value;

  @action
  Future<List> readDetail()async{
    var js = await repository.readDetail(page-1,dados);
    mepsDetailsResumo = js.elementAt(0);
    setQpagina(js.elementAt(1));
    return js;
  }

  @action
  Future<List> readHeader()async{
    var js = await repository.readHeader(pageHeader-1,dados);
    mepsHeadersTrailers = js.elementAt(0);
    qpaginaHeader = js.elementAt(1);
    return js;
  }

}
