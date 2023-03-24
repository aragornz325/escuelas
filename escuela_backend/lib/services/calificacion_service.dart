import 'package:escuela_backend/repositories/calificaciones_repository.dart';
import 'package:escuela_backend/repositories/curso_repository.dart';
import 'package:escuela_backend/services/link_service.dart';

class CalificacionService {
  final _calificacionesRepository = CalificacionesRepository();
  final _cursoRepository = CursoRepository();
  final _linkService = LinkService();
  Future<Map> createCalificacionInBash({required payload}) async {
    final checkNotasCargadas =
        await _linkService.getLinkByToken(payload['token']);
    if (checkNotasCargadas['notasCargadas']) {
      throw Exception('Las notas ya fueron cargadas');
    }

    final curso =
        await _cursoRepository.getCursoByAsignatura(payload['idAsignatura']);
    final alumnosToRepo = [];
    final alumnos = payload['calificaciones'];
    alumnos.forEach((alumno) {
      alumnosToRepo.add({
        'idAlumno': alumno['idAlumno'],
        'idDocente': payload['idDocente'],
        'idCurso': curso['idCurso'],
        'idAsignatura': payload['idAsignatura'],
        'nota': alumno['calificacion'],
        'periodo': payload['periodo'],
      });
    });
    final response = await _calificacionesRepository.createCalificacionInBash(
        alumnosConCalificaciones: alumnosToRepo);

    final notasCargadas = true;
    await _linkService.updatLinkRegister(payload['token'], notasCargadas);
    return {'status': 'ok'};
  }
}
