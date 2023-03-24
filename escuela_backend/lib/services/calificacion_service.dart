import 'package:escuela_backend/repositories/calificaciones_repository.dart';
import 'package:escuela_backend/repositories/curso_repository.dart';

class CalificacionService {
  final calificacionesRepository = CalificacionesRepository();
  final cursoRepository = CursoRepository();
  Future<Map> createCalificacionInBash({required payload}) async {
    final curso =
        await cursoRepository.getCursoByAsignatura(payload['idAsignatura']);
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
    final response = await calificacionesRepository.createCalificacionInBash(
        alumnosConCalificaciones: alumnosToRepo);
    return {'status': 'ok'};
  }
}
