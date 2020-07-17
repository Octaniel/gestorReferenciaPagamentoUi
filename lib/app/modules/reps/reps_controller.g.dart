// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepsController on _RepsControllerBase, Store {
  final _$valueAtom = Atom(name: '_RepsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_RepsControllerBaseActionController =
      ActionController(name: '_RepsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_RepsControllerBaseActionController.startAction(
        name: '_RepsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_RepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
