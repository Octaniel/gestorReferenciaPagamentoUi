class RepsDetailResumo {
  String registoRegeitado;
  String codigoErro;
  String discritivoErro;
  String entidadeHeader;

  RepsDetailResumo(
      {this.registoRegeitado,
        this.codigoErro,
        this.discritivoErro,
        this.entidadeHeader});

  RepsDetailResumo.fromJson(Map<String, dynamic> json) {
    registoRegeitado = json['registoRegeitado'];
    codigoErro = json['codigoErro'];
    discritivoErro = json['discritivoErro'];
    entidadeHeader = json['entidadeHeader'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registoRegeitado'] = this.registoRegeitado;
    data['codigoErro'] = this.codigoErro;
    data['discritivoErro'] = this.discritivoErro;
    data['entidadeHeader'] = this.entidadeHeader;
    return data;
  }
}