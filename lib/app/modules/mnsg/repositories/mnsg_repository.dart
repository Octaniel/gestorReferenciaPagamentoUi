import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/models/mensagem_real_time_response_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/mnsg/models/mensagem_real_time_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:mobx/mobx.dart';

class MnsgRepository extends Disposable {
  Dio dio = new Dio();

  Future<List> read(int page, String referencia) async {
    final response =
    await dio.get("${url}mnsrt?page=$page&size=5&referencia=$referencia",
        options: Options(
          contentType: "application/json",
        ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<MensagemRealTimeResumo> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = MensagemRealTimeResumo.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<MensagemRealTimeResumo> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  Future<List> readResponse(int page, String referencia) async {
    final response =
    await dio.get("${url}mnsrt/response?page=$page&size=5&entidade=$referencia",
        options: Options(
          contentType: "application/json",
        ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<MensagemRealTimeResponseResumo> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = MensagemRealTimeResponseResumo.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<MensagemRealTimeResponseResumo> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
