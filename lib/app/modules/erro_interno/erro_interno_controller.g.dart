// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'erro_interno_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ErroInternoController on _ErroInternoControllerBase, Store {
  final _$apNotAtom = Atom(name: '_ErroInternoControllerBase.apNot');

  @override
  bool get apNot {
    _$apNotAtom.reportRead();
    return super.apNot;
  }

  @override
  set apNot(bool value) {
    _$apNotAtom.reportWrite(value, super.apNot, () {
      super.apNot = value;
    });
  }

  final _$isDrawerAtom = Atom(name: '_ErroInternoControllerBase.isDrawer');

  @override
  bool get isDrawer {
    _$isDrawerAtom.reportRead();
    return super.isDrawer;
  }

  @override
  set isDrawer(bool value) {
    _$isDrawerAtom.reportWrite(value, super.isDrawer, () {
      super.isDrawer = value;
    });
  }

  final _$vAtom = Atom(name: '_ErroInternoControllerBase.v');

  @override
  int get v {
    _$vAtom.reportRead();
    return super.v;
  }

  @override
  set v(int value) {
    _$vAtom.reportWrite(value, super.v, () {
      super.v = value;
    });
  }

  final _$errosInternoAtom =
      Atom(name: '_ErroInternoControllerBase.errosInterno');

  @override
  ObservableList<ErroInterno> get errosInterno {
    _$errosInternoAtom.reportRead();
    return super.errosInterno;
  }

  @override
  set errosInterno(ObservableList<ErroInterno> value) {
    _$errosInternoAtom.reportWrite(value, super.errosInterno, () {
      super.errosInterno = value;
    });
  }

  final _$readErroAsyncAction =
      AsyncAction('_ErroInternoControllerBase.readErro');

  @override
  Future<List<dynamic>> readErro() {
    return _$readErroAsyncAction.run(() => super.readErro());
  }

  final _$atualizarParatrueAsyncAction =
      AsyncAction('_ErroInternoControllerBase.atualizarParatrue');

  @override
  Future<bool> atualizarParatrue(int id) {
    return _$atualizarParatrueAsyncAction
        .run(() => super.atualizarParatrue(id));
  }

  final _$atualizarTodosParatrueAsyncAction =
      AsyncAction('_ErroInternoControllerBase.atualizarTodosParatrue');

  @override
  Future<bool> atualizarTodosParatrue() {
    return _$atualizarTodosParatrueAsyncAction
        .run(() => super.atualizarTodosParatrue());
  }

  @override
  String toString() {
    return '''
apNot: ${apNot},
isDrawer: ${isDrawer},
v: ${v},
errosInterno: ${errosInterno}
    ''';
  }
}
