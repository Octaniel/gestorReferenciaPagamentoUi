class MensagemRealTimeResumo {
  String codigoMenssagem;
  String aplicacaoPdd;
  String nrEntidade;
  String referencia;
  String montantePago;
  String dataTransacaoCliente;
  String horaMovimento;
  String dataHora;

  MensagemRealTimeResumo(
      {this.codigoMenssagem,
        this.aplicacaoPdd,
        this.nrEntidade,
        this.referencia,
        this.montantePago,
        this.dataTransacaoCliente,
        this.horaMovimento,
        this.dataHora});

  MensagemRealTimeResumo.fromJson(Map<String, dynamic> json) {
    codigoMenssagem = json['codigoMenssagem'];
    aplicacaoPdd = json['aplicacaoPdd'];
    nrEntidade = json['nrEntidade'];
    referencia = json['referencia'];
    montantePago = json['montantePago'];
    dataTransacaoCliente = json['dataTransacaoCliente'];
    horaMovimento = json['horaMovimento'];
    dataHora = json['dataHora'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoMenssagem'] = this.codigoMenssagem;
    data['aplicacaoPdd'] = this.aplicacaoPdd;
    data['nrEntidade'] = this.nrEntidade;
    data['referencia'] = this.referencia;
    data['montantePago'] = this.montantePago;
    data['dataTransacaoCliente'] = this.dataTransacaoCliente;
    data['horaMovimento'] = this.horaMovimento;
    data['dataHora'] = this.dataHora;
    return data;
  }
}