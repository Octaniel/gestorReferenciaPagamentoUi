import 'package:gestorReferenciaPagamentoUi/app/modules/home/models/erro_interno.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;
  _HomeControllerBase(this.repository);

  @observable
  ObservableList<ErroInterno> errosInterno;

  @action
  Future<List> readErro()async{
    var js = await repository.readErro();
    errosInterno = js;
    return js;
  }
}
