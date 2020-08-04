import 'package:gestorReferenciaPagamentoUi/app/modules/reps/models/reps_header_trailer.dart';

class RepsDetail {
  int id;
  String registoRegeitado;
  String codigoErro;
  String discritivoErro;
  RepsHeaderTrailer repsHeaderTrailer;

  RepsDetail(
      {this.registoRegeitado,
        this.codigoErro,
        this.discritivoErro,
        this.repsHeaderTrailer});

  RepsDetail.fromJson(Map<String, dynamic> json) {
    registoRegeitado = json['registoRegeitado'];
    codigoErro = json['codigoErro'];
    discritivoErro = json['discritivoErro'];
    repsHeaderTrailer = RepsHeaderTrailer.fromJson(json['repsHeaderTrailer']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registoRegeitado'] = this.registoRegeitado;
    data['codigoErro'] = this.codigoErro;
    data['discritivoErro'] = this.discritivoErro;
    data['repsHeaderTrailer'] = this.repsHeaderTrailer.toJson();
    return data;
  }
}