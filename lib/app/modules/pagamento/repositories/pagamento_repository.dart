import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/pagamento/modules/pagamento_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:mobx/mobx.dart';

class PagamentoRepository extends Disposable {
  final Dio dio;
  PagamentoRepository(this.dio);

  Future<List> read(int page, String referencia) async {
    final response =
    await dio.get("pagamento?page=$page&size=7&referencia=$referencia",
        options: Options(
          contentType: "application/json",
        ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<PagamentoResumo> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = PagamentoResumo.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<PagamentoResumo> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
