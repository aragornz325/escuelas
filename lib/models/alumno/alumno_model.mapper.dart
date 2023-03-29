// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'alumno_model.dart';

class AlumnoModelMapper extends MapperBase<AlumnoModel> {
  static MapperContainer container = MapperContainer(
    mappers: {AlumnoModelMapper()},
  );

  @override
  AlumnoModelMapperElement createElement(MapperContainer container) {
    return AlumnoModelMapperElement._(this, container);
  }

  @override
  String get id => 'AlumnoModel';

  static final fromMap = container.fromMap<AlumnoModel>;
  static final fromJson = container.fromJson<AlumnoModel>;
}

class AlumnoModelMapperElement extends MapperElementBase<AlumnoModel> {
  AlumnoModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  AlumnoModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  AlumnoModel fromMap(Map<String, dynamic> map) => AlumnoModel.create(
      container.$get(map, 'nombre'),
      container.$get(map, 'apellido'),
      container.$get(map, 'email'),
      container.$get(map, 'curso'));

  @override
  Function get encoder => encode;
  dynamic encode(AlumnoModel v) => toMap(v);
  Map<String, dynamic> toMap(AlumnoModel a) => {
        'nombre': container.$enc(a.nombre, 'nombre'),
        'apellido': container.$enc(a.apellido, 'apellido'),
        'email': container.$enc(a.email, 'email'),
        'curso': container.$enc(a.curso, 'curso')
      };

  @override
  String stringify(AlumnoModel self) =>
      'AlumnoModel(idAlumno: ${container.asString(self.idAlumno)}, createdAt: ${container.asString(self.createdAt)}, nombre: ${container.asString(self.nombre)}, apellido: ${container.asString(self.apellido)}, email: ${container.asString(self.email)}, curso: ${container.asString(self.curso)}, egresado: ${container.asString(self.egresado)})';
  @override
  int hash(AlumnoModel self) =>
      container.hash(self.idAlumno) ^
      container.hash(self.createdAt) ^
      container.hash(self.nombre) ^
      container.hash(self.apellido) ^
      container.hash(self.email) ^
      container.hash(self.curso) ^
      container.hash(self.egresado);
  @override
  bool equals(AlumnoModel self, AlumnoModel other) =>
      container.isEqual(self.idAlumno, other.idAlumno) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.nombre, other.nombre) &&
      container.isEqual(self.apellido, other.apellido) &&
      container.isEqual(self.email, other.email) &&
      container.isEqual(self.curso, other.curso) &&
      container.isEqual(self.egresado, other.egresado);
}

mixin AlumnoModelMappable {
  String toJson() => AlumnoModelMapper.container.toJson(this as AlumnoModel);
  Map<String, dynamic> toMap() =>
      AlumnoModelMapper.container.toMap(this as AlumnoModel);
  AlumnoModelCopyWith<AlumnoModel, AlumnoModel, AlumnoModel> get copyWith =>
      _AlumnoModelCopyWithImpl(this as AlumnoModel, $identity, $identity);
  @override
  String toString() => AlumnoModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AlumnoModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => AlumnoModelMapper.container.hash(this);
}

extension AlumnoModelValueCopy<$R, $Out extends AlumnoModel>
    on ObjectCopyWith<$R, AlumnoModel, $Out> {
  AlumnoModelCopyWith<$R, AlumnoModel, $Out> get asAlumnoModel =>
      base.as((v, t, t2) => _AlumnoModelCopyWithImpl(v, t, t2));
}

typedef AlumnoModelCopyWithBound = AlumnoModel;

abstract class AlumnoModelCopyWith<$R, $In extends AlumnoModel,
    $Out extends AlumnoModel> implements ObjectCopyWith<$R, $In, $Out> {
  AlumnoModelCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AlumnoModel>(
      Then<AlumnoModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? nombre, String? apellido, String? email, String? curso});
}

class _AlumnoModelCopyWithImpl<$R, $Out extends AlumnoModel>
    extends CopyWithBase<$R, AlumnoModel, $Out>
    implements AlumnoModelCopyWith<$R, AlumnoModel, $Out> {
  _AlumnoModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  AlumnoModelCopyWith<$R2, AlumnoModel, $Out2>
      chain<$R2, $Out2 extends AlumnoModel>(
              Then<AlumnoModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _AlumnoModelCopyWithImpl($value, t, t2);

  @override
  $R call({String? nombre, String? apellido, String? email, String? curso}) =>
      $then(AlumnoModel.create(
          nombre ?? $value.nombre,
          apellido ?? $value.apellido,
          email ?? $value.email,
          curso ?? $value.curso));
}
