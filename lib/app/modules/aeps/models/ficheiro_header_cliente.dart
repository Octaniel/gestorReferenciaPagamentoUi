class FicheiroHeaderCliente {
  int id;
  String instituicaoOrigem;
  String instituicaoDestino;
  String dataProcessamento;
  String ultimoFicheiroEmviado;
  String entidade;
  String dataEnvio;
  int idPorDia;

  FicheiroHeaderCliente(
      {this.id,
        this.instituicaoOrigem,
        this.instituicaoDestino,
        this.dataProcessamento,
        this.ultimoFicheiroEmviado,
        this.entidade,
        this.dataEnvio,
        this.idPorDia});

  FicheiroHeaderCliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituicaoOrigem = json['instituicaoOrigem'];
    instituicaoDestino = json['instituicaoDestino'];
    dataProcessamento = json['dataProcessamento'];
    ultimoFicheiroEmviado = json['ultimoFicheiroEmviado'];
    entidade = json['entidade'];
    dataEnvio = json['dataEnvio'];
    idPorDia = json['idPorDia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instituicaoOrigem'] = this.instituicaoOrigem;
    data['instituicaoDestino'] = this.instituicaoDestino;
    data['dataProcessamento'] = this.dataProcessamento;
    data['ultimoFicheiroEmviado'] = this.ultimoFicheiroEmviado;
    data['entidade'] = this.entidade;
    data['dataEnvio'] = this.dataEnvio;
    data['idPorDia'] = this.idPorDia;
    return data;
  }
}