// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$apNotAtom = Atom(name: '_HomeControllerBase.apNot');

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

  final _$errosInternoAtom = Atom(name: '_HomeControllerBase.errosInterno');

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

  final _$readErroAsyncAction = AsyncAction('_HomeControllerBase.readErro');

  @override
  Future<List<dynamic>> readErro() {
    return _$readErroAsyncAction.run(() => super.readErro());
  }

  @override
  String toString() {
    return '''
apNot: ${apNot},
errosInterno: ${errosInterno}
    ''';
  }
}
