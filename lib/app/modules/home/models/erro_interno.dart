class ErroInterno {
  int id;
  String nomeFicheiro;
  String mensagem;
  String dataHora;
  bool visto;

  ErroInterno(
      {this.id, this.nomeFicheiro, this.mensagem, this.dataHora, this.visto});

  ErroInterno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeFicheiro = json['nomeFicheiro'];
    mensagem = json['mensagem'];
    dataHora = json['dataHora'];
    visto = json['visto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeFicheiro'] = this.nomeFicheiro;
    data['mensagem'] = this.mensagem;
    data['dataHora'] = this.dataHora;
    data['visto'] = this.visto;
    return data;
  }
}