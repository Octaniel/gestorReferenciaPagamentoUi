// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagamentoController on _PagamentoControllerBase, Store {
  final _$currentIndexAtom =
      Atom(name: '_PagamentoControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$sizeAtom = Atom(name: '_PagamentoControllerBase.size');

  @override
  Size get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(Size value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  final _$dadosAtom = Atom(name: '_PagamentoControllerBase.dados');

  @override
  String get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(String value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$pageAtom = Atom(name: '_PagamentoControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$qpaginaAtom = Atom(name: '_PagamentoControllerBase.qpagina');

  @override
  int get qpagina {
    _$qpaginaAtom.reportRead();
    return super.qpagina;
  }

  @override
  set qpagina(int value) {
    _$qpaginaAtom.reportWrite(value, super.qpagina, () {
      super.qpagina = value;
    });
  }

  final _$pagamentoResumoAtom =
      Atom(name: '_PagamentoControllerBase.pagamentoResumo');

  @override
  ObservableList<PagamentoResumo> get pagamentoResumo {
    _$pagamentoResumoAtom.reportRead();
    return super.pagamentoResumo;
  }

  @override
  set pagamentoResumo(ObservableList<PagamentoResumo> value) {
    _$pagamentoResumoAtom.reportWrite(value, super.pagamentoResumo, () {
      super.pagamentoResumo = value;
    });
  }

  final _$readAsyncAction = AsyncAction('_PagamentoControllerBase.read');

  @override
  Future<List<dynamic>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$_PagamentoControllerBaseActionController =
      ActionController(name: '_PagamentoControllerBase');

  @override
  dynamic setPage(int v) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.setPage');
    try {
      return super.setPage(v);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQpagina(int value) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.setQpagina');
    try {
      return super.setQpagina(value);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
size: ${size},
dados: ${dados},
page: ${page},
qpagina: ${qpagina},
pagamentoResumo: ${pagamentoResumo}
    ''';
  }
}
