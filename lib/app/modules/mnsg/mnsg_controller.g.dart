// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnsg_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MnsgController on _MnsgControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_MnsgControllerBase.currentIndex');

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

  final _$sizeAtom = Atom(name: '_MnsgControllerBase.size');

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

  final _$pageControllerAtom = Atom(name: '_MnsgControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$dadosAtom = Atom(name: '_MnsgControllerBase.dados');

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

  final _$pageAtom = Atom(name: '_MnsgControllerBase.page');

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

  final _$pageResponseAtom = Atom(name: '_MnsgControllerBase.pageResponse');

  @override
  int get pageResponse {
    _$pageResponseAtom.reportRead();
    return super.pageResponse;
  }

  @override
  set pageResponse(int value) {
    _$pageResponseAtom.reportWrite(value, super.pageResponse, () {
      super.pageResponse = value;
    });
  }

  final _$qpaginaResponseAtom =
      Atom(name: '_MnsgControllerBase.qpaginaResponse');

  @override
  int get qpaginaResponse {
    _$qpaginaResponseAtom.reportRead();
    return super.qpaginaResponse;
  }

  @override
  set qpaginaResponse(int value) {
    _$qpaginaResponseAtom.reportWrite(value, super.qpaginaResponse, () {
      super.qpaginaResponse = value;
    });
  }

  final _$qpaginaAtom = Atom(name: '_MnsgControllerBase.qpagina');

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

  final _$mensagensRealTimeResumoAtom =
      Atom(name: '_MnsgControllerBase.mensagensRealTimeResumo');

  @override
  ObservableList<MensagemRealTimeResumo> get mensagensRealTimeResumo {
    _$mensagensRealTimeResumoAtom.reportRead();
    return super.mensagensRealTimeResumo;
  }

  @override
  set mensagensRealTimeResumo(ObservableList<MensagemRealTimeResumo> value) {
    _$mensagensRealTimeResumoAtom
        .reportWrite(value, super.mensagensRealTimeResumo, () {
      super.mensagensRealTimeResumo = value;
    });
  }

  final _$mensagensRealTimeResponseResumoAtom =
      Atom(name: '_MnsgControllerBase.mensagensRealTimeResponseResumo');

  @override
  ObservableList<MensagemRealTimeResponseResumo>
      get mensagensRealTimeResponseResumo {
    _$mensagensRealTimeResponseResumoAtom.reportRead();
    return super.mensagensRealTimeResponseResumo;
  }

  @override
  set mensagensRealTimeResponseResumo(
      ObservableList<MensagemRealTimeResponseResumo> value) {
    _$mensagensRealTimeResponseResumoAtom
        .reportWrite(value, super.mensagensRealTimeResponseResumo, () {
      super.mensagensRealTimeResponseResumo = value;
    });
  }

  final _$readAsyncAction = AsyncAction('_MnsgControllerBase.read');

  @override
  Future<List<dynamic>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readResponseAsyncAction =
      AsyncAction('_MnsgControllerBase.readResponse');

  @override
  Future<List<dynamic>> readResponse() {
    return _$readResponseAsyncAction.run(() => super.readResponse());
  }

  final _$_MnsgControllerBaseActionController =
      ActionController(name: '_MnsgControllerBase');

  @override
  dynamic setPage(int v) {
    final _$actionInfo = _$_MnsgControllerBaseActionController.startAction(
        name: '_MnsgControllerBase.setPage');
    try {
      return super.setPage(v);
    } finally {
      _$_MnsgControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQpagina(int value) {
    final _$actionInfo = _$_MnsgControllerBaseActionController.startAction(
        name: '_MnsgControllerBase.setQpagina');
    try {
      return super.setQpagina(value);
    } finally {
      _$_MnsgControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
size: ${size},
pageController: ${pageController},
dados: ${dados},
page: ${page},
pageResponse: ${pageResponse},
qpaginaResponse: ${qpaginaResponse},
qpagina: ${qpagina},
mensagensRealTimeResumo: ${mensagensRealTimeResumo},
mensagensRealTimeResponseResumo: ${mensagensRealTimeResponseResumo}
    ''';
  }
}
