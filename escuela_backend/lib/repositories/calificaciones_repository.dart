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
    final response = await client
        .from('Nota')
        .select(
            '*, Alumno(nombre, apellido, email), Asignatura(nombre, idAsignatura), Curso(nombre)')
        .eq('periodo', periodo)
        .eq('sentByMail', false)
        .execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    if (response.data.isEmpty) {
      throw Exception('aun no hay calificaciones sin enviar en este periodo');
    }

    List<Map<String, dynamic>> alumnos = [];

    // agrupar notas por alumno
    Map<String, List<Map<String, dynamic>>> notasPorAlumno = {};
    for (var nota in response.data) {
      String idAlumno = nota['idAlumno'];
      if (!notasPorAlumno.containsKey(idAlumno)) {
        notasPorAlumno[idAlumno] = [];
      }
      notasPorAlumno[idAlumno]!.add(nota);
    }

    // crear la lista de alumnos con sus notas
    for (var alumnoNotas in notasPorAlumno.entries) {
      Map<String, dynamic> alumno = {
        'idAlumno': alumnoNotas.key,
        'nombre': alumnoNotas.value[0]['Alumno']['nombre'],
        'apellido': alumnoNotas.value[0]['Alumno']['apellido'],
        'email': alumnoNotas.value[0]['Alumno']['email'],
        'curso': alumnoNotas.value[0]['Curso']['nombre'],
        'notas': [],
      };
      for (var nota in alumnoNotas.value) {
        alumno['notas'].add({
          'idNota': nota['idNota'],
          'NombreAsignatura': nota['Asignatura']['nombre'],
          'idAsignatura': nota['idAsignatura'],
          'idDocente': nota['idDocente'],
          'idEnlace': nota['idEnlace'],
          'nota': nota['nota'],
          'sentByMail': nota['sentByMail'],
          'createdAt': nota['createdAt'],
          'periodo': nota['periodo'],
        });
      }
      alumnos.add(alumno);
    }

    return alumnos;
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
          'idNota': nota['idNota'],
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

  Future<List> getLinksByPeriodo(String periodo) async {
    final response = await client
        .from('Enlace')
        .select('*, Docente(*)')
        .eq('periodo', periodo)
        .eq('active', true)
        .execute();

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

  Future<String> updateNota(
      {required Map<String, dynamic> payload, required String idNota}) async {
    print('payload: ${payload}');
    print('idNota: ${idNota}');

    final response = await client
        .from('Nota')
        .update(payload)
        .eq('idNota', idNota)
        .execute();
    print('response: ${response.data}');
    if (response.error != null) {
      throw Exception(response.error);
    }

    return 'ok';
  }
}
