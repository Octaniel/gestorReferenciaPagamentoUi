import 'package:mobx/mobx.dart';

part 'mnsg_controller.g.dart';

class MnsgController = _MnsgControllerBase with _$MnsgController;

abstract class _MnsgControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
