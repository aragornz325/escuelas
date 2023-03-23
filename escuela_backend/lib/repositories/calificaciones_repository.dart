import 'package:shelf/shelf.dart';

import 'base_repository.dart';

class CalificacionesRepository extends Repository {
  Future<Map> creteCalificionByAlumno(
      {required String idAlumno,
      required String idDocente,
      required String idCurso,
      required String idAsignatura,
      required int calificacion,
      required String periodo}) async {
    final response = await client.from('Nota').insert([
      {
        'idAlumno': idAlumno,
        'idDocente': '1',
        'idCurso': '1',
        'idAsignatura': idAsignatura,
        'nota': calificacion,
        'periodo': '1',
      }
    ]).execute();
    if (response.data.isEmpty) {
      throw Response.found('No se pudo crear la calificacion');
    }
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return response.data;
  }

  Future<List> createCalificacionInBash(
      {required List alumnosConCalificaciones}) async {
    final response =
        await client.from('Nota').insert(alumnosConCalificaciones).execute();
    if (response.data.isEmpty) {
      throw Response.found('No se pudo crear la calificacion');
    }
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return response.data;
  }
}
