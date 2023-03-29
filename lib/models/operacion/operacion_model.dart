// Modelo para la Entidad Operacion.
import 'package:dart_mappable/dart_mappable.dart';

part 'operacion_model.mapper.dart';

@MappableClass(ignoreNull: true)
class OperacionModel with OperacionModelMappable {

  // Campos del modelo.
  String? idOperacion;
  DateTime? createdAt;
  String usuario;
  String operacionRealizada;

  // Version del modelo para creacion.
  OperacionModel.create(this.usuario, this.operacionRealizada);

  // Version del modelo para recuperar informacion.
  OperacionModel.get(this.idOperacion, this.createdAt, this.usuario, this.operacionRealizada);

  // Version del modelo para actualizacion.
  OperacionModel.update(this.usuario, this.operacionRealizada);

}