// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'enlace_model.dart';

class EnlaceModelMapper extends MapperBase<EnlaceModel> {
  static MapperContainer container = MapperContainer(
    mappers: {EnlaceModelMapper()},
  );

  @override
  EnlaceModelMapperElement createElement(MapperContainer container) {
    return EnlaceModelMapperElement._(this, container);
  }

  @override
  String get id => 'EnlaceModel';

  static final fromMap = container.fromMap<EnlaceModel>;
  static final fromJson = container.fromJson<EnlaceModel>;
}

class EnlaceModelMapperElement extends MapperElementBase<EnlaceModel> {
  EnlaceModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  EnlaceModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  EnlaceModel fromMap(Map<String, dynamic> map) => EnlaceModel.create(
      container.$get(map, 'token'),
      container.$get(map, 'idDocente'),
      container.$get(map, 'periodo'),
      container.$get(map, 'idAsignatura'));

  @override
  Function get encoder => encode;
  dynamic encode(EnlaceModel v) => toMap(v);
  Map<String, dynamic> toMap(EnlaceModel e) => {
        'token': container.$enc(e.token, 'token'),
        'idDocente': container.$enc(e.idDocente, 'idDocente'),
        'periodo': container.$enc(e.periodo, 'periodo'),
        'idAsignatura': container.$enc(e.idAsignatura, 'idAsignatura')
      };

  @override
  String stringify(EnlaceModel self) =>
      'EnlaceModel(idEnlace: ${container.asString(self.idEnlace)}, createdAt: ${container.asString(self.createdAt)}, notasCargadas: ${container.asString(self.notasCargadas)}, emailEnviado: ${container.asString(self.emailEnviado)}, active: ${container.asString(self.active)}, token: ${container.asString(self.token)}, idDocente: ${container.asString(self.idDocente)}, periodo: ${container.asString(self.periodo)}, idAsignatura: ${container.asString(self.idAsignatura)})';
  @override
  int hash(EnlaceModel self) =>
      container.hash(self.idEnlace) ^
      container.hash(self.createdAt) ^
      container.hash(self.notasCargadas) ^
      container.hash(self.emailEnviado) ^
      container.hash(self.active) ^
      container.hash(self.token) ^
      container.hash(self.idDocente) ^
      container.hash(self.periodo) ^
      container.hash(self.idAsignatura);
  @override
  bool equals(EnlaceModel self, EnlaceModel other) =>
      container.isEqual(self.idEnlace, other.idEnlace) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.notasCargadas, other.notasCargadas) &&
      container.isEqual(self.emailEnviado, other.emailEnviado) &&
      container.isEqual(self.active, other.active) &&
      container.isEqual(self.token, other.token) &&
      container.isEqual(self.idDocente, other.idDocente) &&
      container.isEqual(self.periodo, other.periodo) &&
      container.isEqual(self.idAsignatura, other.idAsignatura);
}

mixin EnlaceModelMappable {
  String toJson() => EnlaceModelMapper.container.toJson(this as EnlaceModel);
  Map<String, dynamic> toMap() =>
      EnlaceModelMapper.container.toMap(this as EnlaceModel);
  EnlaceModelCopyWith<EnlaceModel, EnlaceModel, EnlaceModel> get copyWith =>
      _EnlaceModelCopyWithImpl(this as EnlaceModel, $identity, $identity);
  @override
  String toString() => EnlaceModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          EnlaceModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => EnlaceModelMapper.container.hash(this);
}

extension EnlaceModelValueCopy<$R, $Out extends EnlaceModel>
    on ObjectCopyWith<$R, EnlaceModel, $Out> {
  EnlaceModelCopyWith<$R, EnlaceModel, $Out> get asEnlaceModel =>
      base.as((v, t, t2) => _EnlaceModelCopyWithImpl(v, t, t2));
}

typedef EnlaceModelCopyWithBound = EnlaceModel;

abstract class EnlaceModelCopyWith<$R, $In extends EnlaceModel,
    $Out extends EnlaceModel> implements ObjectCopyWith<$R, $In, $Out> {
  EnlaceModelCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends EnlaceModel>(
      Then<EnlaceModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call(
      {String? token,
      String? idDocente,
      String? periodo,
      String? idAsignatura});
}

class _EnlaceModelCopyWithImpl<$R, $Out extends EnlaceModel>
    extends CopyWithBase<$R, EnlaceModel, $Out>
    implements EnlaceModelCopyWith<$R, EnlaceModel, $Out> {
  _EnlaceModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  EnlaceModelCopyWith<$R2, EnlaceModel, $Out2>
      chain<$R2, $Out2 extends EnlaceModel>(
              Then<EnlaceModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _EnlaceModelCopyWithImpl($value, t, t2);

  @override
  $R call(
          {String? token,
          String? idDocente,
          String? periodo,
          String? idAsignatura}) =>
      $then(EnlaceModel.create(
          token ?? $value.token,
          idDocente ?? $value.idDocente,
          periodo ?? $value.periodo,
          idAsignatura ?? $value.idAsignatura));
}
