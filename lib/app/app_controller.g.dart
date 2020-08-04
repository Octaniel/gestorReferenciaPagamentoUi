// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {

  final _$isDrawerAtom = Atom(name: '_AppControllerBase.isDrawer');

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
final _$urlAtom = Atom(name: '_AppControllerBase.url');

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  @override
  String toString() {
    return '''
url: ${url}
    ''';
  }
}
