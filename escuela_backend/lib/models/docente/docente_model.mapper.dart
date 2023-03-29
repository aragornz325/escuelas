// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'docente_model.dart';

class DocenteModelMapper extends MapperBase<DocenteModel> {
  static MapperContainer container = MapperContainer(
    mappers: {DocenteModelMapper()},
  );

  @override
  DocenteModelMapperElement createElement(MapperContainer container) {
    return DocenteModelMapperElement._(this, container);
  }

  @override
  String get id => 'DocenteModel';

  static final fromMap = container.fromMap<DocenteModel>;
  static final fromJson = container.fromJson<DocenteModel>;
}

class DocenteModelMapperElement extends MapperElementBase<DocenteModel> {
  DocenteModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  DocenteModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  DocenteModel fromMap(Map<String, dynamic> map) => DocenteModel.create(
      container.$get(map, 'nombre'),
      container.$get(map, 'apellido'),
      container.$get(map, 'email'),
      container.$get(map, 'telefono'));

  @override
  Function get encoder => encode;
  dynamic encode(DocenteModel v) => toMap(v);
  Map<String, dynamic> toMap(DocenteModel d) => {
        'nombre': container.$enc(d.nombre, 'nombre'),
        'apellido': container.$enc(d.apellido, 'apellido'),
        'email': container.$enc(d.email, 'email'),
        'telefono': container.$enc(d.telefono, 'telefono')
      };

  @override
  String stringify(DocenteModel self) =>
      'DocenteModel(idDocente: ${container.asString(self.idDocente)}, createdAt: ${container.asString(self.createdAt)}, nombre: ${container.asString(self.nombre)}, apellido: ${container.asString(self.apellido)}, email: ${container.asString(self.email)}, telefono: ${container.asString(self.telefono)}, active: ${container.asString(self.active)})';
  @override
  int hash(DocenteModel self) =>
      container.hash(self.idDocente) ^
      container.hash(self.createdAt) ^
      container.hash(self.nombre) ^
      container.hash(self.apellido) ^
      container.hash(self.email) ^
      container.hash(self.telefono) ^
      container.hash(self.active);
  @override
  bool equals(DocenteModel self, DocenteModel other) =>
      container.isEqual(self.idDocente, other.idDocente) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.nombre, other.nombre) &&
      container.isEqual(self.apellido, other.apellido) &&
      container.isEqual(self.email, other.email) &&
      container.isEqual(self.telefono, other.telefono) &&
      container.isEqual(self.active, other.active);
}

mixin DocenteModelMappable {
  String toJson() => DocenteModelMapper.container.toJson(this as DocenteModel);
  Map<String, dynamic> toMap() =>
      DocenteModelMapper.container.toMap(this as DocenteModel);
  DocenteModelCopyWith<DocenteModel, DocenteModel, DocenteModel> get copyWith =>
      _DocenteModelCopyWithImpl(this as DocenteModel, $identity, $identity);
  @override
  String toString() => DocenteModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          DocenteModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => DocenteModelMapper.container.hash(this);
}

extension DocenteModelValueCopy<$R, $Out extends DocenteModel>
    on ObjectCopyWith<$R, DocenteModel, $Out> {
  DocenteModelCopyWith<$R, DocenteModel, $Out> get asDocenteModel =>
      base.as((v, t, t2) => _DocenteModelCopyWithImpl(v, t, t2));
}

typedef DocenteModelCopyWithBound = DocenteModel;

abstract class DocenteModelCopyWith<$R, $In extends DocenteModel,
    $Out extends DocenteModel> implements ObjectCopyWith<$R, $In, $Out> {
  DocenteModelCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends DocenteModel>(
      Then<DocenteModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? nombre, String? apellido, String? email, String? telefono});
}

class _DocenteModelCopyWithImpl<$R, $Out extends DocenteModel>
    extends CopyWithBase<$R, DocenteModel, $Out>
    implements DocenteModelCopyWith<$R, DocenteModel, $Out> {
  _DocenteModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  DocenteModelCopyWith<$R2, DocenteModel, $Out2>
      chain<$R2, $Out2 extends DocenteModel>(
              Then<DocenteModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _DocenteModelCopyWithImpl($value, t, t2);

  @override
  $R call(
          {String? nombre,
          String? apellido,
          String? email,
          String? telefono}) =>
      $then(DocenteModel.create(
          nombre ?? $value.nombre,
          apellido ?? $value.apellido,
          email ?? $value.email,
          telefono ?? $value.telefono));
}
