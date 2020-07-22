import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_detail_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_header_trailer.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/repositories/reps_repository.dart';
import 'package:mobx/mobx.dart';

part 'reps_controller.g.dart';

class RepsController = _RepsControllerBase with _$RepsController;

abstract class _RepsControllerBase with Store {

  final repository = RepsRepository();

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
  ObservableList<RepsDetailResumo> repsDetailsResumo;

  @observable
  ObservableList<RepsHeaderTrailer> repsHeadersTrailers;

  @action
  setPage(int v) {
    page = v;
  }

  @action
  setQpagina(int value) =>qpagina = value;

  @action
  Future<List> readDetail()async{
    var js = await repository.readDetail(page-1,dados);
    repsDetailsResumo = js.elementAt(0);
    setQpagina(js.elementAt(1));
    return js;
  }

  @action
  Future<List> readHeader()async{
    var js = await repository.readHeader(pageHeader-1,dados);
    repsHeadersTrailers = js.elementAt(0);
    qpaginaHeader = js.elementAt(1);
    return js;
  }

}
