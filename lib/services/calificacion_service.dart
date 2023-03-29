import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:escuela_backend/repositories/calificaciones_repository.dart';
import 'package:escuela_backend/repositories/curso_repository.dart';
import 'package:escuela_backend/services/link_service.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:dotenv/dotenv.dart' show load, env, DotEnv;
import 'dart:developer' as developer;
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class CalificacionService {
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load();
  final _calificacionesRepository = CalificacionesRepository();
  final _cursoRepository = CursoRepository();
  final _linkService = LinkService();
  Future<Map> createCalificacionInBash({required payload}) async {
    logger.i("se checkeo el link");
    final checkNotasCargadas =
        await _linkService.getLinkByToken(payload['token']);
    if (checkNotasCargadas['notasCargadas']) {
      throw Exception('Las notas ya fueron cargadas');
    }
    final chekJWT =
        JWT.verify(payload['token'], SecretKey(dotEnv['JWT_TOKEN']!));

    final jwtToken = JWT.decode(payload['token']);

    final curso = await _cursoRepository
        .getCursoByAsignatura(jwtToken.payload['asignatura']);

    final alumnosToRepo = [];
    final alumnos = payload['calificaciones'];
    alumnos.forEach((alumno) {
      alumnosToRepo.add({
        'idAlumno': alumno['idAlumno'],
        'idDocente': jwtToken.payload['docente'],
        'idCurso': curso['idCurso'],
        'idAsignatura': jwtToken.payload['asignatura'],
        'nota': alumno['calificacion'],
        'periodo': jwtToken.payload['periodo'],
        'idEnlace': checkNotasCargadas['idEnlace']
      });
    });
    final response = await _calificacionesRepository.createCalificacionInBash(
        alumnosConCalificaciones: alumnosToRepo);

    final notasCargadas = true;
    await _linkService.updatLinkRegister(payload['token'], notasCargadas);
    return {'status': 'ok'};
  }

  Future<List> getCalificacionesByPeriodo({required String periodo}) async {
    final calificaciones = await _calificacionesRepository
        .getCalificacionesByPeriodo(periodo: periodo);
    return calificaciones;
  }
}
