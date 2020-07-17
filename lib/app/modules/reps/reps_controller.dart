import 'package:mobx/mobx.dart';

part 'reps_controller.g.dart';

class RepsController = _RepsControllerBase with _$RepsController;

abstract class _RepsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
