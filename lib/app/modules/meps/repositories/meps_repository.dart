import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_detail_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_header_trailer.dart';
import 'package:mobx/mobx.dart';

class MepsRepository extends Disposable {

  Dio dio = new Dio();

  Future<List> readDetail(int page, String referencia) async {
    final response =
    await dio.get("https://gestoreferencia-pagamento-api.herokuapp.com/meps/detail?page=$page&size=5&referencia=$referencia",
    options: Options(
      contentType: "application/json"
    ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<MepsDetailResumo> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = MepsDetailResumo.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<MepsDetailResumo> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  Future<List> readHeader(int page, String entidade) async {
    final response =
    await dio.get("https://gestoreferencia-pagamento-api.herokuapp.com/meps/header?page=$page&size=5&entidade=$entidade",
    options: Options(
      contentType: "application/json"
    ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<MepsHeaderTrailer> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = MepsHeaderTrailer.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<MepsHeaderTrailer> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }
  
  @override
  void dispose() {}
}
