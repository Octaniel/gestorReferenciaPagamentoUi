import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/aeps_module.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/pages/aeps_page.dart';

void main() {
  initModule(AepsModule());

  testWidgets('AepsPage has title', (tester) async {
      await tester.pumpWidget(buildTestableWidget(AepsPage()));
      final titleFinder = find.text('Ficheiro de Clientes');
      expect(titleFinder, findsOneWidget);
  });
}
