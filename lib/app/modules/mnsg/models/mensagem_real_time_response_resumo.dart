class MensagemRealTimeResponseResumo {
  String codigoResposta;
  String prefix;
  String identificacaoLog;
  String nrEntidade;
  String nidentificacaoResposta;

  MensagemRealTimeResponseResumo(
      {this.codigoResposta,
        this.prefix,
        this.identificacaoLog,
        this.nrEntidade,
        this.nidentificacaoResposta});

  MensagemRealTimeResponseResumo.fromJson(Map<String, dynamic> json) {
    codigoResposta = json['codigoResposta'];
    prefix = json['prefix'];
    identificacaoLog = json['identificacaoLog'];
    nrEntidade = json['nrEntidade'];
    nidentificacaoResposta = json['nidentificacaoResposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoResposta'] = this.codigoResposta;
    data['prefix'] = this.prefix;
    data['identificacaoLog'] = this.identificacaoLog;
    data['nrEntidade'] = this.nrEntidade;
    data['nidentificacaoResposta'] = this.nidentificacaoResposta;
    return data;
  }
}