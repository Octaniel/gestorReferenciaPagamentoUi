import 'package:mobx/mobx.dart';

part 'erro_interno_controller.g.dart';

class ErroInternoController = _ErroInternoControllerBase
    with _$ErroInternoController;

abstract class _ErroInternoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
