import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/models/erro_interno.dart';
import 'package:mobx/mobx.dart';

class ErroInternoRepository extends Disposable {
  final Dio dio;

  ErroInternoRepository(this.dio);

  Future<List> readErro() async {
    final response =
    await dio.get("erro",
        options: Options(
            contentType: "application/json"
        ));
    if(response.statusCode==200){
      ObservableList<ErroInterno> produtoList = ObservableList();
      response.data.forEach((f){
        var cliente = ErroInterno.fromJson(f);
        produtoList.add(cliente);
      });
      return produtoList;
    }
    ObservableList<ErroInterno> produtoList = ObservableList();
    return produtoList;
  }

  Future<List> readErroAll() async {
    final response =
    await dio.get("erro/all",
        options: Options(
            contentType: "application/json"
        ));
    if(response.statusCode==200){
      List listReturn = List();
      int v = 0;
      ObservableList<ErroInterno> produtoList = ObservableList();
      response.data.forEach((f){
        var cliente = ErroInterno.fromJson(f);
        if(!cliente.visto) v = v+1;
        produtoList.add(cliente);
      });
      listReturn.insert(0, v);
      listReturn.insert(1, produtoList);
      return listReturn;
    }
    ObservableList<ErroInterno> produtoList = ObservableList();
    return produtoList;
  }

  Future<bool> atualizarParatrue(int id) async {
    final response =
    await dio.put("erro/$id",
        options: Options(
            contentType: "application/json"
        ));
    if(response.statusCode==200){
      return true;
    }
    return false;
  }

  Future<bool> atualizarTodosParatrue() async {
    final response =
    await dio.put("erro",
        options: Options(
            contentType: "application/json"
        ));
    if(response.statusCode==200){
      return true;
    }
    return false;
  }
  //dispose will be called automatically
  @override
  void dispose() {}
}
