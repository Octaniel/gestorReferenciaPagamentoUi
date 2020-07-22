import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/models/FicheiroDetalheClienteResumo.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/aeps/models/FicheiroHeaderCliente.dart';
import 'package:gestorReferenciaPagamentoUi/app/res/static.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class AepsRepository extends Disposable {

  Future<List> read(int page, String referencia) async {
    final response =
    await http.get("${url}modeloFicheiro?page=$page&size=5&referencia=$referencia",headers: <String,String>{
      "Content-Type":"application/json"
    });
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<FicheiroDetalheClienteResumo> produtoList = ObservableList();
      var decode = await jsonDecode(response.body);
      List decode2 = await decode["content"];
      decode2.forEach((f){
        var cliente = FicheiroDetalheClienteResumo.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await decode["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<FicheiroDetalheClienteResumo> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  Future<List> readHeader(int page, String entidade) async {
    final response =
    await http.get("${url}modeloFicheiro/headerCliente?page=$page&size=5&entidade=$entidade",headers: <String,String>{
      "Content-Type":"application/json"
    });
    if(response.statusCode==200){
      List listRetorno = List();
      ObservableList<FicheiroHeaderCliente> produtoList = ObservableList();
      var decode = await jsonDecode(response.body);
      List decode2 = await decode["content"];
      decode2.forEach((f){
        var cliente = FicheiroHeaderCliente.fromJson(f);
        produtoList.add(cliente);
      });
      listRetorno.insert(0, produtoList);
      listRetorno.insert(1, await decode["totalPages"]);
      return listRetorno;
    }
    List listRetorno = List();
    ObservableList<FicheiroHeaderCliente> produtoList = ObservableList();
    listRetorno.insert(0, produtoList);
    return listRetorno;
  }

  @override
  void dispose() {}
}
