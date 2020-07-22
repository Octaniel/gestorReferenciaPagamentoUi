import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestorReferenciaPagamentoUi/app/modules/home/models/erro_interno.dart';
import 'package:mobx/mobx.dart';

class HomeRepository extends Disposable {
  final Dio dio;

  HomeRepository(this.dio);

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

  //dispose will be called automatically
  @override
  void dispose() {}
}
