import 'package:gestorReferenciaPagamentoUi/app/modules/home/models/erro_interno.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'erro_interno_controller.g.dart';

class ErroInternoController = _ErroInternoControllerBase
    with _$ErroInternoController;

abstract class _ErroInternoControllerBase with Store {
  final HomeRepository repository;

  _ErroInternoControllerBase(this.repository);

  @observable
  bool apNot = false;

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
