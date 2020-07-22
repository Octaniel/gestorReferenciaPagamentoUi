class RepsHeaderTrailer {
  int id;
  String instituicaoOrigem;
  String instituicaoDestino;
  String identificacaoFicheiro;
  String identficacaoUltimoFicheiroEnviado;
  String entidade;
  String dataProcessamentoOriginal;
  String numeroRegistoDetalhe;
  String dataCria;

  RepsHeaderTrailer(
      {this.id,
        this.instituicaoOrigem,
        this.instituicaoDestino,
        this.identificacaoFicheiro,
        this.identficacaoUltimoFicheiroEnviado,
        this.entidade,
        this.dataProcessamentoOriginal,
        this.numeroRegistoDetalhe,
        this.dataCria});

  RepsHeaderTrailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituicaoOrigem = json['instituicaoOrigem'];
    instituicaoDestino = json['instituicaoDestino'];
    identificacaoFicheiro = json['identificacaoFicheiro'];
    identficacaoUltimoFicheiroEnviado =
    json['identficacaoUltimoFicheiroEnviado'];
    entidade = json['entidade'];
    dataProcessamentoOriginal = json['dataProcessamentoOriginal'];
    numeroRegistoDetalhe = json['numeroRegistoDetalhe'];
    dataCria = json['dataCria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instituicaoOrigem'] = this.instituicaoOrigem;
    data['instituicaoDestino'] = this.instituicaoDestino;
    data['identificacaoFicheiro'] = this.identificacaoFicheiro;
    data['identficacaoUltimoFicheiroEnviado'] =
        this.identficacaoUltimoFicheiroEnviado;
    data['entidade'] = this.entidade;
    data['dataProcessamentoOriginal'] = this.dataProcessamentoOriginal;
    data['numeroRegistoDetalhe'] = this.numeroRegistoDetalhe;
    data['dataCria'] = this.dataCria;
    return data;
  }
}