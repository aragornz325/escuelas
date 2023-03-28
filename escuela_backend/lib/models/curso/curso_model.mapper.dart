// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'curso_model.dart';

class CursoModelMapper extends MapperBase<CursoModel> {
  static MapperContainer container = MapperContainer(
    mappers: {CursoModelMapper()},
  );

  @override
  CursoModelMapperElement createElement(MapperContainer container) {
    return CursoModelMapperElement._(this, container);
  }

  @override
  String get id => 'CursoModel';

  static final fromMap = container.fromMap<CursoModel>;
  static final fromJson = container.fromJson<CursoModel>;
}

class CursoModelMapperElement extends MapperElementBase<CursoModel> {
  CursoModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CursoModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CursoModel fromMap(Map<String, dynamic> map) => CursoModel.create(
      container.$getOpt(map, 'asignaturas'),
      container.$get(map, 'anioLectivo'),
      container.$getOpt(map, 'alumnos'),
      container.$get(map, 'nombre'));

  @override
  Function get encoder => encode;
  dynamic encode(CursoModel v) => toMap(v);
  Map<String, dynamic> toMap(CursoModel c) => {
        if (container.$enc(c.asignaturas, 'asignaturas') != null)
          'asignaturas': container.$enc(c.asignaturas, 'asignaturas'),
        'anioLectivo': container.$enc(c.anioLectivo, 'anioLectivo'),
        if (container.$enc(c.alumnos, 'alumnos') != null)
          'alumnos': container.$enc(c.alumnos, 'alumnos'),
        'nombre': container.$enc(c.nombre, 'nombre')
      };

  @override
  String stringify(CursoModel self) =>
      'CursoModel(idCurso: ${container.asString(self.idCurso)}, createdAt: ${container.asString(self.createdAt)}, asignaturas: ${container.asString(self.asignaturas)}, anioLectivo: ${container.asString(self.anioLectivo)}, alumnos: ${container.asString(self.alumnos)}, nombre: ${container.asString(self.nombre)}, active: ${container.asString(self.active)})';
  @override
  int hash(CursoModel self) =>
      container.hash(self.idCurso) ^
      container.hash(self.createdAt) ^
      container.hash(self.asignaturas) ^
      container.hash(self.anioLectivo) ^
      container.hash(self.alumnos) ^
      container.hash(self.nombre) ^
      container.hash(self.active);
  @override
  bool equals(CursoModel self, CursoModel other) =>
      container.isEqual(self.idCurso, other.idCurso) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.asignaturas, other.asignaturas) &&
      container.isEqual(self.anioLectivo, other.anioLectivo) &&
      container.isEqual(self.alumnos, other.alumnos) &&
      container.isEqual(self.nombre, other.nombre) &&
      container.isEqual(self.active, other.active);
}

mixin CursoModelMappable {
  String toJson() => CursoModelMapper.container.toJson(this as CursoModel);
  Map<String, dynamic> toMap() =>
      CursoModelMapper.container.toMap(this as CursoModel);
  CursoModelCopyWith<CursoModel, CursoModel, CursoModel> get copyWith =>
      _CursoModelCopyWithImpl(this as CursoModel, $identity, $identity);
  @override
  String toString() => CursoModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CursoModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => CursoModelMapper.container.hash(this);
}

extension CursoModelValueCopy<$R, $Out extends CursoModel>
    on ObjectCopyWith<$R, CursoModel, $Out> {
  CursoModelCopyWith<$R, CursoModel, $Out> get asCursoModel =>
      base.as((v, t, t2) => _CursoModelCopyWithImpl(v, t, t2));
}

typedef CursoModelCopyWithBound = CursoModel;

abstract class CursoModelCopyWith<$R, $In extends CursoModel,
    $Out extends CursoModel> implements ObjectCopyWith<$R, $In, $Out> {
  CursoModelCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends CursoModel>(
      Then<CursoModel, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get asignaturas;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get alumnos;
  $R call(
      {List<String>? asignaturas,
      int? anioLectivo,
      List<String>? alumnos,
      String? nombre});
}

class _CursoModelCopyWithImpl<$R, $Out extends CursoModel>
    extends CopyWithBase<$R, CursoModel, $Out>
    implements CursoModelCopyWith<$R, CursoModel, $Out> {
  _CursoModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  CursoModelCopyWith<$R2, CursoModel, $Out2>
      chain<$R2, $Out2 extends CursoModel>(
              Then<CursoModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _CursoModelCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get asignaturas => $value.asignaturas != null
          ? ListCopyWith(
              $value.asignaturas!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(asignaturas: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get alumnos =>
      $value.alumnos != null
          ? ListCopyWith(
              $value.alumnos!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(alumnos: v))
          : null;
  @override
  $R call(
          {Object? asignaturas = $none,
          int? anioLectivo,
          Object? alumnos = $none,
          String? nombre}) =>
      $then(CursoModel.create(
          or(asignaturas, $value.asignaturas),
          anioLectivo ?? $value.anioLectivo,
          or(alumnos, $value.alumnos),
          nombre ?? $value.nombre));
}
