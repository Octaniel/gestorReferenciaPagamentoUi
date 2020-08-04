import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_detail.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_header_trailer.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class RepsRepository extends Disposable {
  Dio dio = new Dio();

  Future<List> readDetail(int page, String codigoErro) async {
    final response =
    await dio.get("${url}reps/detail?page=$page&size=5&codigoErro=$codigoErro",
          options: Options(
            contentType: "application/json",
          ));
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<RepsDetail> produtoList = ObservableList();
      List decode2 = await response.data["content"];
      decode2.forEach((f){
        var cliente = RepsDetail.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await response.data["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<RepsDetail> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  Future<List<String>> readFic(String idFile) async {
    final response =
    await dio.get("${url}modeloFicheiro/fic/reps", queryParameters: {
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

  Future<bool> updateResolvido(int id) async {
    final response =
    await dio.put("${url}reps/$id");
    if(response.statusCode==200){
      return true;
    }
    return false;
  }

  Future<List> readHeader(int page, String entidade) async {
    final response =
    await http.get("${url}reps/header?page=$page&size=5&entidade=$entidade",headers: <String,String>{
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
