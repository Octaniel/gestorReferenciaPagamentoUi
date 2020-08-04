import 'package:gestorReferenciaPagamentoUi/app/modules/meps/models/meps_header_trailer.dart';

class MepsDetail {
  int id;
  String identificacaoEgr;
  String numeroEgr;
  String dataHoraTransacaoCliente;
  String montantePago;
  String tarifa;
  String tipoTerminal;
  String identificacaoTerminal;
  String identificacaoTransacao;
  String localidadeTerminal;
  String modoEnvioComunicacao;
  String codigoRespostaEmpresa;
  String numeroIdentificacaoResposta;
  MepsHeaderTrailer headerMeps;
  String referenciaPagamento;

  MepsDetail({
    this.identificacaoEgr,
    this.numeroEgr,
    this.dataHoraTransacaoCliente,
    this.montantePago,
    this.tarifa,
    this.tipoTerminal,
    this.identificacaoTerminal,
    this.identificacaoTransacao,
    this.localidadeTerminal,
    this.modoEnvioComunicacao,
    this.codigoRespostaEmpresa,
    this.numeroIdentificacaoResposta,
    this.referenciaPagamento,
    this.headerMeps,
  });

  MepsDetail.fromJson(Map<String, dynamic> json) {
    identificacaoEgr = json['identificacaoEgr'];
    numeroEgr = json['numeroEgr'];
    dataHoraTransacaoCliente = json['dataHoraTransacaoCliente'];
    montantePago = json['montantePago'];
    tarifa = json['tarifa'];
    tipoTerminal = json['tipoTerminal'];
    identificacaoTerminal = json['identificacaoTerminal'];
    identificacaoTransacao = json['identificacaoTransacao'];
    localidadeTerminal = json['localidadeTerminal'];
    modoEnvioComunicacao = json['modoEnvioComunicacao'];
    codigoRespostaEmpresa = json['codigoRespostaEmpresa'];
    numeroIdentificacaoResposta = json['numeroIdentificacaoResposta'];
    referenciaPagamento = json['referenciaPagamento'];
    headerMeps = MepsHeaderTrailer.fromJson(json['headerMeps']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identificacaoEgr'] = this.identificacaoEgr;
    data['numeroEgr'] = this.numeroEgr;
    data['dataHoraTransacaoCliente'] = this.dataHoraTransacaoCliente;
    data['montantePago'] = this.montantePago;
    data['tarifa'] = this.tarifa;
    data['tipoTerminal'] = this.tipoTerminal;
    data['identificacaoTerminal'] = this.identificacaoTerminal;
    data['identificacaoTransacao'] = this.identificacaoTransacao;
    data['localidadeTerminal'] = this.localidadeTerminal;
    data['modoEnvioComunicacao'] = this.modoEnvioComunicacao;
    data['codigoRespostaEmpresa'] = this.codigoRespostaEmpresa;
    data['numeroIdentificacaoResposta'] = this.numeroIdentificacaoResposta;
    data['referenciaPagamento'] = this.referenciaPagamento;
    data['headerMeps'] = this.headerMeps;
    return data;
  }
}
