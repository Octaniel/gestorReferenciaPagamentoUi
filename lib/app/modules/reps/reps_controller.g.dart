// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepsController on _RepsControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_RepsControllerBase.currentIndex');

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

  final _$sizeAtom = Atom(name: '_RepsControllerBase.size');

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

  final _$pageControllerAtom = Atom(name: '_RepsControllerBase.pageController');

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

  final _$dadosAtom = Atom(name: '_RepsControllerBase.dados');

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

  final _$pageAtom = Atom(name: '_RepsControllerBase.page');

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

  final _$pageHeaderAtom = Atom(name: '_RepsControllerBase.pageHeader');

  @override
  int get pageHeader {
    _$pageHeaderAtom.reportRead();
    return super.pageHeader;
  }

  @override
  set pageHeader(int value) {
    _$pageHeaderAtom.reportWrite(value, super.pageHeader, () {
      super.pageHeader = value;
    });
  }

  final _$qpaginaHeaderAtom = Atom(name: '_RepsControllerBase.qpaginaHeader');

  @override
  int get qpaginaHeader {
    _$qpaginaHeaderAtom.reportRead();
    return super.qpaginaHeader;
  }

  @override
  set qpaginaHeader(int value) {
    _$qpaginaHeaderAtom.reportWrite(value, super.qpaginaHeader, () {
      super.qpaginaHeader = value;
    });
  }

  final _$qpaginaAtom = Atom(name: '_RepsControllerBase.qpagina');

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

  final _$repsDetailsResumoAtom =
      Atom(name: '_RepsControllerBase.repsDetailsResumo');

  @override
  ObservableList<RepsDetailResumo> get repsDetailsResumo {
    _$repsDetailsResumoAtom.reportRead();
    return super.repsDetailsResumo;
  }

  @override
  set repsDetailsResumo(ObservableList<RepsDetailResumo> value) {
    _$repsDetailsResumoAtom.reportWrite(value, super.repsDetailsResumo, () {
      super.repsDetailsResumo = value;
    });
  }

  final _$repsHeadersTrailersAtom =
      Atom(name: '_RepsControllerBase.repsHeadersTrailers');

  @override
  ObservableList<RepsHeaderTrailer> get repsHeadersTrailers {
    _$repsHeadersTrailersAtom.reportRead();
    return super.repsHeadersTrailers;
  }

  @override
  set repsHeadersTrailers(ObservableList<RepsHeaderTrailer> value) {
    _$repsHeadersTrailersAtom.reportWrite(value, super.repsHeadersTrailers, () {
      super.repsHeadersTrailers = value;
    });
  }

  final _$readDetailAsyncAction = AsyncAction('_RepsControllerBase.readDetail');

  @override
  Future<List<dynamic>> readDetail() {
    return _$readDetailAsyncAction.run(() => super.readDetail());
  }

  final _$readHeaderAsyncAction = AsyncAction('_RepsControllerBase.readHeader');

  @override
  Future<List<dynamic>> readHeader() {
    return _$readHeaderAsyncAction.run(() => super.readHeader());
  }

  final _$_RepsControllerBaseActionController =
      ActionController(name: '_RepsControllerBase');

  @override
  dynamic setPage(int v) {
    final _$actionInfo = _$_RepsControllerBaseActionController.startAction(
        name: '_RepsControllerBase.setPage');
    try {
      return super.setPage(v);
    } finally {
      _$_RepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQpagina(int value) {
    final _$actionInfo = _$_RepsControllerBaseActionController.startAction(
        name: '_RepsControllerBase.setQpagina');
    try {
      return super.setQpagina(value);
    } finally {
      _$_RepsControllerBaseActionController.endAction(_$actionInfo);
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
pageHeader: ${pageHeader},
qpaginaHeader: ${qpaginaHeader},
qpagina: ${qpagina},
repsDetailsResumo: ${repsDetailsResumo},
repsHeadersTrailers: ${repsHeadersTrailers}
    ''';
  }
}
