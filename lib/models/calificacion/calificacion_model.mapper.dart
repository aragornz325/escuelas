// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'calificacion_model.dart';

class CalificacionModelMapper extends MapperBase<CalificacionModel> {
  static MapperContainer container = MapperContainer(
    mappers: {CalificacionModelMapper()},
  );

  @override
  CalificacionModelMapperElement createElement(MapperContainer container) {
    return CalificacionModelMapperElement._(this, container);
  }

  @override
  String get id => 'CalificacionModel';

  static final fromMap = container.fromMap<CalificacionModel>;
  static final fromJson = container.fromJson<CalificacionModel>;
}

class CalificacionModelMapperElement
    extends MapperElementBase<CalificacionModel> {
  CalificacionModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CalificacionModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CalificacionModel fromMap(Map<String, dynamic> map) =>
      CalificacionModel.create(
          container.$get(map, 'idAsignatura'),
          container.$get(map, 'periodo'),
          container.$get(map, 'idEnlace'),
          container.$getOpt(map, 'sentByMail'),
          container.$get(map, 'idAlumno'),
          container.$get(map, 'idCurso'),
          container.$get(map, 'idDocente'),
          container.$getOpt(map, 'nota'));

  @override
  Function get encoder => encode;
  dynamic encode(CalificacionModel v) => toMap(v);
  Map<String, dynamic> toMap(CalificacionModel c) => {
        'idAsignatura': container.$enc(c.idAsignatura, 'idAsignatura'),
        'periodo': container.$enc(c.periodo, 'periodo'),
        'idEnlace': container.$enc(c.idEnlace, 'idEnlace'),
        if (container.$enc(c.sentByMail, 'sentByMail') != null)
          'sentByMail': container.$enc(c.sentByMail, 'sentByMail'),
        'idAlumno': container.$enc(c.idAlumno, 'idAlumno'),
        'idCurso': container.$enc(c.idCurso, 'idCurso'),
        'idDocente': container.$enc(c.idDocente, 'idDocente'),
        if (container.$enc(c.nota, 'nota') != null)
          'nota': container.$enc(c.nota, 'nota')
      };

  @override
  String stringify(CalificacionModel self) =>
      'CalificacionModel(idCalificacion: ${container.asString(self.idCalificacion)}, idAsignatura: ${container.asString(self.idAsignatura)}, periodo: ${container.asString(self.periodo)}, idEnlace: ${container.asString(self.idEnlace)}, sentByMail: ${container.asString(self.sentByMail)}, createdAt: ${container.asString(self.createdAt)}, idCurso: ${container.asString(self.idCurso)}, idAlumno: ${container.asString(self.idAlumno)}, idDocente: ${container.asString(self.idDocente)}, nota: ${container.asString(self.nota)})';
  @override
  int hash(CalificacionModel self) =>
      container.hash(self.idCalificacion) ^
      container.hash(self.idAsignatura) ^
      container.hash(self.periodo) ^
      container.hash(self.idEnlace) ^
      container.hash(self.sentByMail) ^
      container.hash(self.createdAt) ^
      container.hash(self.idCurso) ^
      container.hash(self.idAlumno) ^
      container.hash(self.idDocente) ^
      container.hash(self.nota);
  @override
  bool equals(CalificacionModel self, CalificacionModel other) =>
      container.isEqual(self.idCalificacion, other.idCalificacion) &&
      container.isEqual(self.idAsignatura, other.idAsignatura) &&
      container.isEqual(self.periodo, other.periodo) &&
      container.isEqual(self.idEnlace, other.idEnlace) &&
      container.isEqual(self.sentByMail, other.sentByMail) &&
      container.isEqual(self.createdAt, other.createdAt) &&
      container.isEqual(self.idCurso, other.idCurso) &&
      container.isEqual(self.idAlumno, other.idAlumno) &&
      container.isEqual(self.idDocente, other.idDocente) &&
      container.isEqual(self.nota, other.nota);
}

mixin CalificacionModelMappable {
  String toJson() =>
      CalificacionModelMapper.container.toJson(this as CalificacionModel);
  Map<String, dynamic> toMap() =>
      CalificacionModelMapper.container.toMap(this as CalificacionModel);
  CalificacionModelCopyWith<CalificacionModel, CalificacionModel,
          CalificacionModel>
      get copyWith => _CalificacionModelCopyWithImpl(
          this as CalificacionModel, $identity, $identity);
  @override
  String toString() => CalificacionModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CalificacionModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => CalificacionModelMapper.container.hash(this);
}

extension CalificacionModelValueCopy<$R, $Out extends CalificacionModel>
    on ObjectCopyWith<$R, CalificacionModel, $Out> {
  CalificacionModelCopyWith<$R, CalificacionModel, $Out>
      get asCalificacionModel =>
          base.as((v, t, t2) => _CalificacionModelCopyWithImpl(v, t, t2));
}

typedef CalificacionModelCopyWithBound = CalificacionModel;

abstract class CalificacionModelCopyWith<$R, $In extends CalificacionModel,
    $Out extends CalificacionModel> implements ObjectCopyWith<$R, $In, $Out> {
  CalificacionModelCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends CalificacionModel>(
          Then<CalificacionModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call(
      {String? idAsignatura,
      String? periodo,
      String? idEnlace,
      bool? sentByMail,
      String? idAlumno,
      String? idCurso,
      String? idDocente,
      int? nota});
}

class _CalificacionModelCopyWithImpl<$R, $Out extends CalificacionModel>
    extends CopyWithBase<$R, CalificacionModel, $Out>
    implements CalificacionModelCopyWith<$R, CalificacionModel, $Out> {
  _CalificacionModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  CalificacionModelCopyWith<$R2, CalificacionModel, $Out2>
      chain<$R2, $Out2 extends CalificacionModel>(
              Then<CalificacionModel, $Out2> t, Then<$Out2, $R2> t2) =>
          _CalificacionModelCopyWithImpl($value, t, t2);

  @override
  $R call(
          {String? idAsignatura,
          String? periodo,
          String? idEnlace,
          Object? sentByMail = $none,
          String? idAlumno,
          String? idCurso,
          String? idDocente,
          Object? nota = $none}) =>
      $then(CalificacionModel.create(
          idAsignatura ?? $value.idAsignatura,
          periodo ?? $value.periodo,
          idEnlace ?? $value.idEnlace,
          or(sentByMail, $value.sentByMail),
          idAlumno ?? $value.idAlumno,
          idCurso ?? $value.idCurso,
          idDocente ?? $value.idDocente,
          or(nota, $value.nota)));
}
