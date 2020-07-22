class MepsHeaderTrailer {
  int id;
  String instituicaoOrigem;
  String instituicaoDestino;
  String dataProcessamento;
  String identificacaoUltimoFicheiro;
  String entidade;
  String taxaIva;
  String montanteTotalTransacoes;
  String totalTarifacao;
  String codigoMoeda;
  String iva;

  MepsHeaderTrailer(
      {this.id,
        this.instituicaoOrigem,
        this.instituicaoDestino,
        this.dataProcessamento,
        this.identificacaoUltimoFicheiro,
        this.entidade,
        this.taxaIva,
        this.montanteTotalTransacoes,
        this.totalTarifacao,
        this.codigoMoeda,
        this.iva});

  MepsHeaderTrailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituicaoOrigem = json['instituicaoOrigem'];
    instituicaoDestino = json['instituicaoDestino'];
    dataProcessamento = json['dataProcessamento'];
    identificacaoUltimoFicheiro = json['identificacaoUltimoFicheiro'];
    entidade = json['entidade'];
    taxaIva = json['taxaIva'];
    montanteTotalTransacoes = json['montanteTotalTransacoes'];
    totalTarifacao = json['totalTarifacao'];
    codigoMoeda = json['codigoMoeda'];
    iva = json['iva'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instituicaoOrigem'] = this.instituicaoOrigem;
    data['instituicaoDestino'] = this.instituicaoDestino;
    data['dataProcessamento'] = this.dataProcessamento;
    data['identificacaoUltimoFicheiro'] = this.identificacaoUltimoFicheiro;
    data['entidade'] = this.entidade;
    data['taxaIva'] = this.taxaIva;
    data['montanteTotalTransacoes'] = this.montanteTotalTransacoes;
    data['totalTarifacao'] = this.totalTarifacao;
    data['codigoMoeda'] = this.codigoMoeda;
    data['iva'] = this.iva;
    return data;
  }
}