// Modelo para la Entidad Enlace.
import 'package:dart_mappable/dart_mappable.dart';

part 'enlace_model.mapper.dart';

@MappableClass(ignoreNull: true)
class EnlaceModel with EnlaceModelMappable {

  // Campos del modelo.
  String? idEnlace;
  DateTime? createdAt;
  bool? notasCargadas;
  bool? emailEnviado;
  bool? active;
  String token;
  String idDocente;
  String periodo;
  String idAsignatura;

  // Version del modelo para creacion.
  EnlaceModel.create(this.token, this.idDocente, this.periodo, this.idAsignatura);

  // Version del modelo para recuperar informacion.
  EnlaceModel.get(this.idEnlace, this.createdAt, this.notasCargadas, this.emailEnviado, this.active, this.token, this.idDocente, this.periodo, this.idAsignatura);

  // Version del modelo para actualizacion.
  EnlaceModel.update(this.notasCargadas, this.emailEnviado, this.active, this.token, this.idDocente, this.periodo, this.idAsignatura);

}