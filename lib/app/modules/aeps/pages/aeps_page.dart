import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/butao_nav_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/detail/paginated_data_table_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/header/paginated_data_table_header.dart';

import '../aeps_controller.dart';

class AepsPage extends StatefulWidget {
  final String title;

  const AepsPage({Key key, this.title = "Aeps"}) : super(key: key);

  @override
  _AepsPageState createState() => _AepsPageState();
}

class _AepsPageState extends ModularState<AepsPage, AepsController> {
  @override
  void initState() {
    super.initState();
    controller.pageController = PageController();
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d363b),
        title: Text("Ficheiro de Clientes"),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            setState(() => controller.currentIndex = index);
          },
          children: <Widget>[
            PaginatedDataTableDetail(),
            PaginatedDataTableHeader(),
          ],
        ),
      ),
      bottomNavigationBar: ButaoNavBar(),
    );
  }
}
