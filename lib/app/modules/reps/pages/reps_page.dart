import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/butao_nav_bar_reps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/detail/paginated_data_table_reps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/header/paginated_data_table_reps_header.dart';
import '../reps_controller.dart';

class RepsPage extends StatefulWidget {
  final String title;
  const RepsPage({Key key, this.title = "Reps"}) : super(key: key);

  @override
  _RepsPageState createState() => _RepsPageState();
}

class _RepsPageState extends ModularState<RepsPage, RepsController> {
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
        title: Text("Ficheiro de Retorno"),
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
            PaginatedDataTableRepsDetail(),
            PaginatedDataTableRepsHeader(),
          ],
        ),
      ),
      bottomNavigationBar: ButaoNavBarReps(),
    );
  }
}
