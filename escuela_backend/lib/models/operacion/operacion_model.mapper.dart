// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'operacion_model.dart';

class OperacionModelMapper extends MapperBase<OperacionModel> {
  static MapperContainer container = MapperContainer(
    mappers: {OperacionModelMapper()},
  );

  @override
  OperacionModelMapperElement createElement(MapperContainer container) {
    return OperacionModelMapperElement._(this, container);
  }

  @override
  String get id => 'OperacionModel';

  static final fromMap = container.fromMap<OperacionModel>;
  static final fromJson = container.fromJson<OperacionModel>;
}

class OperacionModelMapperElement extends MapperElementBase<OperacionModel> {
  OperacionModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  OperacionModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  OperacionModel fromMap(Map<String, dynamic> map) => OperacionModel.create(
      container.$get(map, 'usuario'),
      container.$get(map, 'operacionRealizada'));

  @override
  Function get encoder => encode;
  dynamic encode(OperacionModel v) => toMap(v);
  Map<String, dynamic> toMap(OperacionModel o) => {
        'usuario': container.$enc(o.usuario, 'usuario'),
        'operacionRealizada':
            container.$enc(o.operacionRealizada, 'operacionRealizada')
      };

  @override
  String stringify(OperacionModel self) =>
      'OperacionModel(idOperacion: ${container.asString(self.idOperacion)}, createdAt: ${container.asString(self.createdAt)}, usuario: ${container.asString(self.usuario)}, operacionRealizada: ${container.asString(self.operacionRealizada)})';
  @override
  int hash(OperacionModel self) =>
      container.hash(self.idOperacion) ^
      container.hash(self.createdAt) ^
      container.hash(self.usuario) ^
      container.hash(self.operacionRealizada);
  @override
  bool equals(OperacionModel self, OperacionModel other) =>
      container.isEqual(self.idOperacion, other.idOperacion) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.usuario, other.usuario) &&
      container.isEqual(self.operacionRealizada, other.operacionRealizada);
}

mixin OperacionModelMappable {
  String toJson() =>
      OperacionModelMapper.container.toJson(this as OperacionModel);
  Map<String, dynamic> toMap() =>
      OperacionModelMapper.container.toMap(this as OperacionModel);
  OperacionModelCopyWith<OperacionModel, OperacionModel, OperacionModel>
      get copyWith => _OperacionModelCopyWithImpl(
          this as OperacionModel, $identity, $identity);
  @override
  String toString() => OperacionModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          OperacionModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => OperacionModelMapper.container.hash(this);
}

extension OperacionModelValueCopy<$R, $Out extends OperacionModel>
    on ObjectCopyWith<$R, OperacionModel, $Out> {
  OperacionModelCopyWith<$R, OperacionModel, $Out> get asOperacionModel =>
      base.as((v, t, t2) => _OperacionModelCopyWithImpl(v, t, t2));
}

typedef OperacionModelCopyWithBound = OperacionModel;

abstract class OperacionModelCopyWith<$R, $In extends OperacionModel,
    $Out extends OperacionModel> implements ObjectCopyWith<$R, $In, $Out> {
  OperacionModelCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends OperacionModel>(
          Then<OperacionModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? usuario, String? operacionRealizada});
}

class _OperacionModelCopyWithImpl<$R, $Out extends OperacionModel>
    extends CopyWithBase<$R, OperacionModel, $Out>
    implements OperacionModelCopyWith<$R, OperacionModel, $Out> {
  _OperacionModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  OperacionModelCopyWith<$R2, OperacionModel, $Out2>
      chain<$R2, $Out2 extends OperacionModel>(
              Then<OperacionModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _OperacionModelCopyWithImpl($value, t, t2);

  @override
  $R call({String? usuario, String? operacionRealizada}) =>
      $then(OperacionModel.create(usuario ?? $value.usuario,
          operacionRealizada ?? $value.operacionRealizada));
}
