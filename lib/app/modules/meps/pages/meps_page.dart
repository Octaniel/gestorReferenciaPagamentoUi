import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/widgets/butao_nav_bar_meps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/widgets/detail/paginated_data_table_meps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/widgets/header/paginated_data_table_meps_header.dart';
import '../meps_controller.dart';

class MepsPage extends StatefulWidget {
  final String title;
  const MepsPage({Key key, this.title = "Meps"}) : super(key: key);

  @override
  _MepsPageState createState() => _MepsPageState();
}

class _MepsPageState extends ModularState<MepsPage, MepsController> {
  //use 'controller' variable to access controller
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
        title: Text("Ficheiro de Movimentos"),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.currentIndex = index;
          },
          children: <Widget>[
            PaginatedDataTableMepsDetail(),
            PaginatedDataTableMepsHeader(),
          ],
        ),
      ),
      bottomNavigationBar: ButaoNavBarMeps(),
    );
  }
}
