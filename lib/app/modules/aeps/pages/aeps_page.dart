import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/app_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/butao_nav_bar_aeps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/detail/paginated_data_table_aeps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/widgets/header/paginated_data_table_aeps_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/app_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/bot_nav_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/drawer.dart';

import '../aeps_controller.dart';

class AepsPage extends StatefulWidget {
  final String title;

  const AepsPage({Key key, this.title = "Aeps"}) : super(key: key);

  @override
  _AepsPageState createState() => _AepsPageState();
}

class _AepsPageState extends ModularState<AepsPage, AepsController> {
  AppController ap = Modular.get();
  Size size;

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
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Observer(builder: (_) {
        return SafeArea(
          child: Container(
            color: background,
            height: size.height,
            width: size.width,
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
                    ButaoNavBarAeps(),
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
          ? size.width
          : size.width - (size.width * .15599),
      height: size.height - 159,
      child: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            setState(() => controller.currentIndex = index);
          },
          children: <Widget>[
            PaginatedDataTableAepsDetail(),
            PaginatedDataTableAepsHeader(),
          ],
        ),
      ),
    );
  }
}
