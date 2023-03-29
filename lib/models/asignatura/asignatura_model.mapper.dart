// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'asignatura_model.dart';

class AsignaturaModelMapper extends MapperBase<AsignaturaModel> {
  static MapperContainer container = MapperContainer(
    mappers: {AsignaturaModelMapper()},
  );

  @override
  AsignaturaModelMapperElement createElement(MapperContainer container) {
    return AsignaturaModelMapperElement._(this, container);
  }

  @override
  String get id => 'AsignaturaModel';

  static final fromMap = container.fromMap<AsignaturaModel>;
  static final fromJson = container.fromJson<AsignaturaModel>;
}

class AsignaturaModelMapperElement extends MapperElementBase<AsignaturaModel> {
  AsignaturaModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  AsignaturaModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  AsignaturaModel fromMap(Map<String, dynamic> map) => AsignaturaModel.create(
      container.$get(map, 'nombre'), container.$get(map, 'docente'));

  @override
  Function get encoder => encode;
  dynamic encode(AsignaturaModel v) => toMap(v);
  Map<String, dynamic> toMap(AsignaturaModel a) => {
        'nombre': container.$enc(a.nombre, 'nombre'),
        'docente': container.$enc(a.docente, 'docente')
      };

  @override
  String stringify(AsignaturaModel self) =>
      'AsignaturaModel(idAsignatura: ${container.asString(self.idAsignatura)}, createdAt: ${container.asString(self.createdAt)}, nombre: ${container.asString(self.nombre)}, docente: ${container.asString(self.docente)}, active: ${container.asString(self.active)})';
  @override
  int hash(AsignaturaModel self) =>
      container.hash(self.idAsignatura) ^
      container.hash(self.createdAt) ^
      container.hash(self.nombre) ^
      container.hash(self.docente) ^
      container.hash(self.active);
  @override
  bool equals(AsignaturaModel self, AsignaturaModel other) =>
      container.isEqual(self.idAsignatura, other.idAsignatura) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.nombre, other.nombre) &&
      container.isEqual(self.docente, other.docente) &&
      container.isEqual(self.active, other.active);
}

mixin AsignaturaModelMappable {
  String toJson() =>
      AsignaturaModelMapper.container.toJson(this as AsignaturaModel);
  Map<String, dynamic> toMap() =>
      AsignaturaModelMapper.container.toMap(this as AsignaturaModel);
  AsignaturaModelCopyWith<AsignaturaModel, AsignaturaModel, AsignaturaModel>
      get copyWith => _AsignaturaModelCopyWithImpl(
          this as AsignaturaModel, $identity, $identity);
  @override
  String toString() => AsignaturaModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AsignaturaModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => AsignaturaModelMapper.container.hash(this);
}

extension AsignaturaModelValueCopy<$R, $Out extends AsignaturaModel>
    on ObjectCopyWith<$R, AsignaturaModel, $Out> {
  AsignaturaModelCopyWith<$R, AsignaturaModel, $Out> get asAsignaturaModel =>
      base.as((v, t, t2) => _AsignaturaModelCopyWithImpl(v, t, t2));
}

typedef AsignaturaModelCopyWithBound = AsignaturaModel;

abstract class AsignaturaModelCopyWith<$R, $In extends AsignaturaModel,
    $Out extends AsignaturaModel> implements ObjectCopyWith<$R, $In, $Out> {
  AsignaturaModelCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends AsignaturaModel>(
          Then<AsignaturaModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? nombre, String? docente});
}

class _AsignaturaModelCopyWithImpl<$R, $Out extends AsignaturaModel>
    extends CopyWithBase<$R, AsignaturaModel, $Out>
    implements AsignaturaModelCopyWith<$R, AsignaturaModel, $Out> {
  _AsignaturaModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  AsignaturaModelCopyWith<$R2, AsignaturaModel, $Out2>
      chain<$R2, $Out2 extends AsignaturaModel>(
              Then<AsignaturaModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _AsignaturaModelCopyWithImpl($value, t, t2);

  @override
  $R call({String? nombre, String? docente}) => $then(AsignaturaModel.create(
      nombre ?? $value.nombre, docente ?? $value.docente));
}
