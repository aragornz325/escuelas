// Modelo para la Entidad Curso.
import 'package:dart_mappable/dart_mappable.dart';

part 'curso_model.mapper.dart';

@MappableClass(ignoreNull: true)
class CursoModel with CursoModelMappable {

  String? idCurso;
  DateTime? createdAt;
  List<String>? asignaturas;
  int anioLectivo;
  List<String>? alumnos;
  String nombre;
  bool? active;

  // Version del modelo para creacion.
  CursoModel.create(this.asignaturas, this.anioLectivo, this.alumnos, this.nombre);

  // Version del modelo para recuperar informacion.
  CursoModel.get(this.idCurso, this.createdAt, this.asignaturas, this.anioLectivo, this.alumnos, this.nombre, this.active);

  // Version del modelo para actualizacion.
  CursoModel.update(this.asignaturas, this.anioLectivo, this.alumnos, this.nombre, this.active);

}