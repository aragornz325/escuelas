// Modelo para la Entidad Docente.
import 'package:dart_mappable/dart_mappable.dart';

part 'docente_model.mapper.dart';

@MappableClass(ignoreNull: true)
class DocenteModel with DocenteModelMappable {

  // Campos del modelo.
  String? idDocente;
  DateTime? createdAt;
  String nombre;
  String apellido;
  String email;
  String telefono;
  bool? active;

  // Version del modelo para creacion.
  DocenteModel.create(this.nombre, this.apellido, this.email, this.telefono);

  // Version del modelo para recuperar informacion.
  DocenteModel.get(this.idDocente, this.createdAt, this.nombre, this.apellido, this.email, this.telefono, this.active);

  // Version del modelo para actualizacion.
  DocenteModel.update(this.nombre, this.apellido, this.email, this.telefono, this.active);

}