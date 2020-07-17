import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void add(int i) {
    value = i;
  }

  @action
  void increment() {
    value ++;
  }
}
