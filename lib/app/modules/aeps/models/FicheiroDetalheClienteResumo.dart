class FicheiroDetalheClienteResumo {
  String referencia;
  String dataLimitePagamento;
  String montanteMaximo;
  String dataInicioPagamento;
  String montanteMinimo;
  String codigoCliente;
  bool status;
  String entidade;

  FicheiroDetalheClienteResumo(
      {this.referencia,
        this.dataLimitePagamento,
        this.montanteMaximo,
        this.dataInicioPagamento,
        this.montanteMinimo,
        this.codigoCliente,
        this.status,
        this.entidade});

  FicheiroDetalheClienteResumo.fromJson(Map<String, dynamic> json) {
    referencia = json['referencia'];
    dataLimitePagamento = json['dataLimitePagamento'];
    montanteMaximo = json['montanteMaximo'];
    dataInicioPagamento = json['dataInicioPagamento'];
    montanteMinimo = json['montanteMinimo'];
    codigoCliente = json['codigoCliente'];
    status = json['status'];
    entidade = json['entidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referencia'] = this.referencia;
    data['dataLimitePagamento'] = this.dataLimitePagamento;
    data['montanteMaximo'] = this.montanteMaximo;
    data['dataInicioPagamento'] = this.dataInicioPagamento;
    data['montanteMinimo'] = this.montanteMinimo;
    data['codigoCliente'] = this.codigoCliente;
    data['status'] = this.status;
    data['entidade'] = this.entidade;
    return data;
  }
}