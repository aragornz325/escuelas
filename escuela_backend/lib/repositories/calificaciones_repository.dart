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

  Future<List> getCalificacionesByPeriodo({required String periodo}) async {
    final response =
        await client.from('Nota').select().eq('periodo', periodo).execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    if (response.data.isEmpty) {
      throw Response.found('aun no hay calificaciones en este periodo');
    }
    return response.data;
  }

  /// get notas by idDocente, populate with alumno and materia
  Future<List<Map>> getCalificacionesByDocente(
      {required String idDocente}) async {
    final response = await client
        .from('Nota')
        .select(
            'nota, Alumno:idAlumno(nombre, apellido, email), Asignatura:idAsignatura(nombre), Curso:idCurso(nombre)')
        .eq('idDocente', idDocente)
        .execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    final notasByAlumno = <String, Map<String, dynamic>>{};

    for (final nota in response.data) {
      final nombreAlumno = nota['Alumno']['nombre'] as String;

      // ignore: avoid_single_cascade_in_expression_statements
      notasByAlumno.putIfAbsent(
          nombreAlumno,
          () => {
                'nombre': nombreAlumno,
                'apellido': nota['Alumno']['apellido'],
                'email': nota['Alumno']['email'],
                'notas': [],
              })
        ..['notas'].add({
          'asignatura': nota['Asignatura']['nombre'],
          'curso': nota['Curso']['nombre'],
          'nota': nota['nota'],
        });
    }

    return notasByAlumno.values.toList();
  }

  Future<List<Map>> getCalificacionesByCurso({required String idCurso}) async {
    final response = await client
        .from('Nota')
        .select(
            'nota, Alumno:idAlumno(nombre, apellido, email), Asignatura:idAsignatura(nombre), Curso:idCurso(nombre)')
        .eq('idCurso', idCurso)
        .execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    final notasByAlumno = <String, Map<String, dynamic>>{};

    for (final nota in response.data) {
      final nombreAlumno = nota['Alumno']['nombre'] as String;

      // ignore: avoid_single_cascade_in_expression_statements
      notasByAlumno.putIfAbsent(
          nombreAlumno,
          () => {
                'nombre': nombreAlumno,
                'apellido': nota['Alumno']['apellido'],
                'email': nota['Alumno']['email'],
                'notas': [],
              })
        ..['notas'].add({
          'asignatura': nota['Asignatura']['nombre'],
          'curso': nota['Curso']['nombre'],
          'nota': nota['nota'],
        });
    }

    return notasByAlumno.values.toList();
  }

  Future<List> getCalificacionesByidEnlace({required String idEnlace}) async {
    final response = await client
        .from('Nota')
        .select(
            'nota, Alumno:idAlumno(nombre, apellido, email), Asignatura:idAsignatura(nombre), Curso:idCurso(nombre)')
        .eq('idEnlace', idEnlace)
        .execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    final notasByAlumno = <String, Map<String, dynamic>>{};
    for (final nota in response.data) {
      final nombreAlumno = nota['Alumno']['nombre'] as String;

      // ignore: avoid_single_cascade_in_expression_statements
      notasByAlumno.putIfAbsent(
          nombreAlumno,
          () => {
                'nombre': nombreAlumno,
                'apellido': nota['Alumno']['apellido'],
                'email': nota['Alumno']['email'],
                'notas': [],
              })
        ..['notas'].add({
          'asignatura': nota['Asignatura']['nombre'],
          'curso': nota['Curso']['nombre'],
          'nota': nota['nota'],
        });
    }

    return notasByAlumno.values.toList();
  }
}
