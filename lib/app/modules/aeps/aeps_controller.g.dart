// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aeps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AepsController on _AepsControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_AepsControllerBase.currentIndex');

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

  final _$sizeAtom = Atom(name: '_AepsControllerBase.size');

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

  final _$pageControllerAtom = Atom(name: '_AepsControllerBase.pageController');

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

  final _$dadosAtom = Atom(name: '_AepsControllerBase.dados');

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

  final _$pageAtom = Atom(name: '_AepsControllerBase.page');

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

  final _$pageHeaderAtom = Atom(name: '_AepsControllerBase.pageHeader');

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

  final _$qpaginaHeaderAtom = Atom(name: '_AepsControllerBase.qpaginaHeader');

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

  final _$qpaginaAtom = Atom(name: '_AepsControllerBase.qpagina');

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

  final _$ficheirodetalheclientesAtom =
      Atom(name: '_AepsControllerBase.ficheirodetalheclientes');

  @override
  ObservableList<FicheiroDetalheClienteResumo> get ficheirodetalheclientes {
    _$ficheirodetalheclientesAtom.reportRead();
    return super.ficheirodetalheclientes;
  }

  @override
  set ficheirodetalheclientes(
      ObservableList<FicheiroDetalheClienteResumo> value) {
    _$ficheirodetalheclientesAtom
        .reportWrite(value, super.ficheirodetalheclientes, () {
      super.ficheirodetalheclientes = value;
    });
  }

  final _$ficheirHeaderClientesAtom =
      Atom(name: '_AepsControllerBase.ficheirHeaderClientes');

  @override
  ObservableList<FicheiroHeaderCliente> get ficheirHeaderClientes {
    _$ficheirHeaderClientesAtom.reportRead();
    return super.ficheirHeaderClientes;
  }

  @override
  set ficheirHeaderClientes(ObservableList<FicheiroHeaderCliente> value) {
    _$ficheirHeaderClientesAtom.reportWrite(value, super.ficheirHeaderClientes,
        () {
      super.ficheirHeaderClientes = value;
    });
  }

  final _$readAsyncAction = AsyncAction('_AepsControllerBase.read');

  @override
  Future<List<dynamic>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readHeaderAsyncAction = AsyncAction('_AepsControllerBase.readHeader');

  @override
  Future<List<dynamic>> readHeader() {
    return _$readHeaderAsyncAction.run(() => super.readHeader());
  }

  final _$_AepsControllerBaseActionController =
      ActionController(name: '_AepsControllerBase');

  @override
  dynamic setPage(int v) {
    final _$actionInfo = _$_AepsControllerBaseActionController.startAction(
        name: '_AepsControllerBase.setPage');
    try {
      return super.setPage(v);
    } finally {
      _$_AepsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQpagina(int value) {
    final _$actionInfo = _$_AepsControllerBaseActionController.startAction(
        name: '_AepsControllerBase.setQpagina');
    try {
      return super.setQpagina(value);
    } finally {
      _$_AepsControllerBaseActionController.endAction(_$actionInfo);
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
ficheirodetalheclientes: ${ficheirodetalheclientes},
ficheirHeaderClientes: ${ficheirHeaderClientes}
    ''';
  }
}
