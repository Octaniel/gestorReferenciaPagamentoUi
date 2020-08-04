import 'ficheiro_header_cliente.dart';

class FicheiroDetalheCliente {
  int id;
  String referencia;
  String dataLimitePagamento;
  String montanteMaximo;
  String dataInicioPagamento;
  String montanteMinimo;
  String codigoCliente;
  bool status;
  String dataCria;
  FicheiroHeaderCliente ficheiroHeaderCliente;

  FicheiroDetalheCliente({
    this.id,
    this.referencia,
    this.dataLimitePagamento,
    this.montanteMaximo,
    this.dataInicioPagamento,
    this.montanteMinimo,
    this.codigoCliente,
    this.status,
    this.dataCria,
    this.ficheiroHeaderCliente
  });

  FicheiroDetalheCliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referencia = json['referencia'];
    dataLimitePagamento = json['dataLimitePagamento'];
    montanteMaximo = json['montanteMaximo'];
    dataInicioPagamento = json['dataInicioPagamento'];
    montanteMinimo = json['montanteMinimo'];
    codigoCliente = json['codigoCliente'];
    status = json['status'];
    dataCria = json['dataCria'];
    ficheiroHeaderCliente = FicheiroHeaderCliente.fromJson(json['ficheiroHeaderCliente']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referencia'] = this.referencia;
    data['dataLimitePagamento'] = this.dataLimitePagamento;
    data['montanteMaximo'] = this.montanteMaximo;
    data['dataInicioPagamento'] = this.dataInicioPagamento;
    data['montanteMinimo'] = this.montanteMinimo;
    data['codigoCliente'] = this.codigoCliente;
    data['status'] = this.status;
    data['dataCria'] = this.dataCria;
    data['ficheiroHeaderCliente'] = this.ficheiroHeaderCliente;
    return data;
  }
}
