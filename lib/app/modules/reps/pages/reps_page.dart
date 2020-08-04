import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/butao_nav_bar_reps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/detail/paginated_data_table_reps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/header/paginated_data_table_reps_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/app_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/bot_nav_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/drawer.dart';
import '../../../app_controller.dart';
import '../reps_controller.dart';

class RepsPage extends StatefulWidget {
  final String title;
  const RepsPage({Key key, this.title = "Reps"}) : super(key: key);

  @override
  _RepsPageState createState() => _RepsPageState();
}

class _RepsPageState extends ModularState<RepsPage, RepsController> {
  AppController ap = Modular.get();

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
      backgroundColor: background,
      body: Observer(builder: (_) {
        return SafeArea(
          child: Container(
            color: background,
            height: controller.size.height,
            width: controller.size.width,
            child: Row(
              children: [
                ap.isDrawer ? DrawerG() : Container(),
                Column(
                  children: [
                    AppBarG(),
                    _body(),
                    Spacer(
                      flex: 330,
                    ),
                    ButaoNavBarReps(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    BotNavBar(),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  _body() {
    return Container(
      width: !ap.isDrawer
          ? controller.size.width
          : controller.size.width - (controller.size.width * .15599),
      height: controller.size.height - 159,
      child: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            setState(() => controller.currentIndex = index);
          },
          children: <Widget>[
            PaginatedDataTableRepsDetail(),
            PaginatedDataTableRepsHeader(),
          ],
        ),
      ),
    );
  }
}
