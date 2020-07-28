import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_detail_resumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_header_trailer.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class RepsRepository extends Disposable {
  Dio dio = new Dio();

  Future<List> readDetail(int page, String codigoErro) async {
    final response =
    await dio.get("${url}reps/detail?page=$page&size=6&codigoErro=$codigoErro",
          options: Options(
            contentType: "application/json",
          ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<RepsDetailResumo> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = RepsDetailResumo.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<RepsDetailResumo> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  Future<List> readHeader(int page, String entidade) async {
    final response =
    await http.get("${url}reps/header?page=$page&size=6&entidade=$entidade",headers: <String,String>{
      "Content-Type":"application/json"
    });
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<RepsHeaderTrailer> produtoList = ObservableList();
      var decode = await jsonDecode(response.body);
      List decode2 = await decode["content"];
      decode2.forEach((f){
        var cliente = RepsHeaderTrailer.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await decode["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<RepsHeaderTrailer> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }


  //dispose will be called automatically
  @override
  void dispose() {}
}
