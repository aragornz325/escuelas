// Modelo para la Entidad Asignatura.
import 'package:dart_mappable/dart_mappable.dart';

part 'asignatura_model.mapper.dart';

@MappableClass(ignoreNull: true)
class AsignaturaModel with AsignaturaModelMappable {

  String? idAsignatura;
  DateTime? createdAt;
  String nombre;
  String docente;
  bool? active;

  // Version del modelo para creacion.
  AsignaturaModel.create(this.nombre, this.docente);

  // Version del modelo para recuperar informacion.
  AsignaturaModel.get(this.idAsignatura, this.createdAt, this.nombre, this.docente, this.active);

  // Version del modelo para actualizacion.
  AsignaturaModel.update(this.nombre, this.docente, this.active);

}