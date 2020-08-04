import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_header_trailer.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:mobx/mobx.dart';

class MepsRepository extends Disposable {

  Dio dio = new Dio();

  Future<List> readDetail(int page, String referencia) async {
    final response =
    await dio.get("${url}meps/detail?page=$page&size=6&referencia=$referencia",
    options: Options(
      contentType: "application/json"
    ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<MepsDetail> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = MepsDetail.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<MepsDetail> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  Future<List<String>> readFic(String idFile) async {
    final response =
    await dio.get("${url}modeloFicheiro/fic/meps", queryParameters: {
      "identificacaoFile": idFile
    });
    if(response.statusCode==200){
      List lt = response.data;
      List<String> sts = List();
      lt.forEach((element) {
        sts.add(element);
      });
      return sts;
    }
    return List();
  }

  Future<List> readHeader(int page, String entidade) async {
    final response =
    await dio.get("${url}meps/header?page=$page&size=6&entidade=$entidade",
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
