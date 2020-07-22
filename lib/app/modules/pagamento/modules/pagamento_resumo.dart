class PagamentoResumo {
  String data;
  int valor;
  String referencia;
  String nomeFicheiroMeps;
  String dataInsercaoMensagem;

  PagamentoResumo(
      {this.data,
        this.valor,
        this.referencia,
        this.nomeFicheiroMeps,
        this.dataInsercaoMensagem});

  PagamentoResumo.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    valor = json['valor'];
    referencia = json['referencia'];
    nomeFicheiroMeps = json['nomeFicheiroMeps'];
    dataInsercaoMensagem = json['dataInsercaoMensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['valor'] = this.valor;
    data['referencia'] = this.referencia;
    data['nomeFicheiroMeps'] = this.nomeFicheiroMeps;
    data['dataInsercaoMensagem'] = this.dataInsercaoMensagem;
    return data;
  }
}