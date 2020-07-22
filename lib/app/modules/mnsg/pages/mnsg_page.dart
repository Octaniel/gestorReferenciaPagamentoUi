import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/butao_nav_bar_mnsg.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/request/paginated_data_table_mnsg_request.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/widgets/response/paginated_data_table_mnsg_response.dart';
import '../mnsg_controller.dart';

class MnsgPage extends StatefulWidget {
  final String title;
  const MnsgPage({Key key, this.title = "Mnsg"}) : super(key: key);

  @override
  _MnsgPageState createState() => _MnsgPageState();
}

class _MnsgPageState extends ModularState<MnsgPage, MnsgController> {

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
        title: Text("Mensagem em Real Time"),
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
            PaginatedDataTableMnsgRequest(),
            PaginatedDataTableMnsgResponse(),
          ],
        ),
      ),
      bottomNavigationBar: ButaoNavBarMnsg(),
    );
  }
}
