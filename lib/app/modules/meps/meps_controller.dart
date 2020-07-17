import 'package:mobx/mobx.dart';

part 'meps_controller.g.dart';

class MepsController = _MepsControllerBase with _$MepsController;

abstract class _MepsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
