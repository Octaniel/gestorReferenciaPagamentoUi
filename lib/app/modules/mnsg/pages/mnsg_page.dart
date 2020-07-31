import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/app_controller.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/butao_nav_bar_mnsg.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/request/paginated_data_table_mnsg_request.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/response/paginated_data_table_mnsg_response.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/app_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/bot_nav_bar.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/drawer.dart';
import '../mnsg_controller.dart';

class MnsgPage extends StatefulWidget {
  final String title;
  const MnsgPage({Key key, this.title = "Mnsg"}) : super(key: key);

  @override
  _MnsgPageState createState() => _MnsgPageState();
}

class _MnsgPageState extends ModularState<MnsgPage, MnsgController> {
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
                    ButaoNavBarMnsg(),
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
            PaginatedDataTableMnsgRequest(),
            PaginatedDataTableMnsgResponse(),
          ],
        ),
      ),
    );
  }
}
