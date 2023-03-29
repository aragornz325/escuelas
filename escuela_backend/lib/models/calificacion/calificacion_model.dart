// Modelo para la Entidad Calificacion.
import 'package:dart_mappable/dart_mappable.dart';

part 'calificacion_model.mapper.dart';

@MappableClass(ignoreNull: true)
class CalificacionModel with CalificacionModelMappable {

  @MappableField(key: 'idNota')
  String? idCalificacion;

  String idAsignatura;
  String periodo;
  String idEnlace;
  bool? sentByMail;
  DateTime? createdAt;
  String idCurso;
  String idAlumno;
  String idDocente;
  int? nota;

  // Version del modelo para creacion.
  CalificacionModel.create(this.idAsignatura, this.periodo, this.idEnlace, this.sentByMail,this.idAlumno, this.idCurso, this.idDocente, this.nota);

  // Version del modelo para recuperar informacion.
  CalificacionModel.get(this.idCalificacion, this.createdAt, this.idAsignatura, this.periodo, this.idEnlace, this.sentByMail, this.idAlumno, this.idCurso, this.idDocente, this.nota);

  // Version del modelo para actualizacion.
  CalificacionModel.update(this.idAsignatura, this.periodo, this.idEnlace, this.sentByMail, this.idAlumno, this.idCurso, this.idDocente, this.nota);

}