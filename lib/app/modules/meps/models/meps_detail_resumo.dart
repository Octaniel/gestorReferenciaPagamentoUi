class MepsDetailResumo {
  String identificacaoEgr;
  String dataHoraTransacaoCliente;
  String montantePago;
  String identificacaoTransacao;
  String modoEnvioComunicacao;
  String codigoRespostaEmpresa;
  String numeroIdentificacaoResposta;
  String referenciaPagamento;

  MepsDetailResumo(
      {this.identificacaoEgr,
        this.dataHoraTransacaoCliente,
        this.montantePago,
        this.identificacaoTransacao,
        this.modoEnvioComunicacao,
        this.codigoRespostaEmpresa,
        this.numeroIdentificacaoResposta,
        this.referenciaPagamento});

  MepsDetailResumo.fromJson(Map<String, dynamic> json) {
    identificacaoEgr = json['identificacaoEgr'];
    dataHoraTransacaoCliente = json['dataHoraTransacaoCliente'];
    montantePago = json['montantePago'];
    identificacaoTransacao = json['identificacaoTransacao'];
    modoEnvioComunicacao = json['modoEnvioComunicacao'];
    codigoRespostaEmpresa = json['codigoRespostaEmpresa'];
    numeroIdentificacaoResposta = json['numeroIdentificacaoResposta'];
    referenciaPagamento = json['referenciaPagamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identificacaoEgr'] = this.identificacaoEgr;
    data['dataHoraTransacaoCliente'] = this.dataHoraTransacaoCliente;
    data['montantePago'] = this.montantePago;
    data['identificacaoTransacao'] = this.identificacaoTransacao;
    data['modoEnvioComunicacao'] = this.modoEnvioComunicacao;
    data['codigoRespostaEmpresa'] = this.codigoRespostaEmpresa;
    data['numeroIdentificacaoResposta'] = this.numeroIdentificacaoResposta;
    data['referenciaPagamento'] = this.referenciaPagamento;
    return data;
  }
}