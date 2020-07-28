import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/butao_nav_bar_reps.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/detail/paginated_data_table_reps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/widgets/header/paginated_data_table_reps_header.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:gestorReferenciaPagamentoUi/app/widgets/bot_nav_bar.dart';
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
      backgroundColor: background,
      body: Column(
        children: [
          appbar(),
          Container(
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
          )
        ],
      ),
      bottomNavigationBar: bnb(),
    );
  }

  bnb(){
    return Container(
      height: 109,
      child: Column(
        children: [
          ButaoNavBarReps(),
          Padding(padding: EdgeInsets.only(top: 10)),
          BotNavBar()
        ],
      ),
    );
  }

  appbar() {
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          Padding(padding: EdgeInsets.only(left: 597)),
          Text(
            "REPS",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: textColor),
          ),
          Padding(padding: EdgeInsets.only(left: 598.5)),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Container(
                width: 13,
                height: 13,
                margin: EdgeInsets.only(left: 25, top: 10),
                decoration: ShapeDecoration(
                  color: Color(0xFF1860DE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
