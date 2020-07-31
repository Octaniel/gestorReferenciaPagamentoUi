import 'dart:ui';

import 'package:gestorReferenciaPagamentoUi/app/modules/home/models/erro_interno.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;
  _HomeControllerBase(this.repository);

  @observable
  bool apNot = false;

  @observable
  Size size;

  @observable
  bool isDrawer = true;

  @observable
  int v = 0;

  @observable
  ObservableList<ErroInterno> errosInterno;

  @action
  Future<List> readErro()async{
    var js = await repository.readErroAll();
    errosInterno = js.elementAt(1);
    v = js.elementAt(0);
    print(errosInterno.length);
    return js;
  }
  @action
  Future<bool> atualizarParatrue(int id) async {
    var atualizarParatrue = await repository.atualizarParatrue(id);
     if(atualizarParatrue){
       readErro();
     }
     return atualizarParatrue;
  }
  @action
  Future<bool> atualizarTodosParatrue() async {
    var atualizarParatrue = await repository.atualizarTodosParatrue();
    if(atualizarParatrue){
      readErro();
    }
    return atualizarParatrue;
  }
}
