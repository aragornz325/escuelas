// Modelo para la Entidad Usuario.
import 'package:dart_mappable/dart_mappable.dart';

part 'alumno_model.mapper.dart';

@MappableClass(ignoreNull: true)
class AlumnoModel with AlumnoModelMappable {

  // Campos del modelo.
  String? idAlumno;
  DateTime? createdAt;
  String nombre;
  String apellido;
  String email;
  String curso;
  bool? egresado;

  // Version del modelo para creacion.
  @MappableConstructor()
  AlumnoModel.create(this.nombre, this.apellido, this.email, this.curso);

  // Version del modelo para recuperar informacion.
  @MappableConstructor()
  AlumnoModel.get(this.idAlumno, this.createdAt, this.nombre, this.apellido, this.email, this.curso, this.egresado);

  // Version del modelo para actualizacion.
  @MappableConstructor()
  AlumnoModel.update(this.nombre, this.apellido, this.email, this.curso);

}