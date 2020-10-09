import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_detail.dart';
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
  ObservableList<RepsDetail> repsDetails;

  @observable
  ObservableList<RepsHeaderTrailer> repsHeadersTrailers;

  @action
  setPage(int v) {
    page = v;
  }

  @observable
  List<String> sts = List();

  @action
  setQpagina(int value) =>qpagina = value;

  @action
  Future<List> readDetail()async{
    var js = await repository.readDetail(page-1,dados);
    repsDetails = js.elementAt(0);
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

  @action
  Future<List> readFic(String idFile)async{
    var js = await repository.readFic(idFile);
    sts = js;
    print(sts.length);
    return js;
  }

  @action
  Future<void> updateResolvido(int idFich)async{
    if(await repository.updateResolvido(idFich)){
     await readHeader();
    }
  }

}
