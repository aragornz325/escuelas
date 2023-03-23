import 'base_repository.dart';

class NotaRepository extends Repository {

  /// get notas by idDocente, populate with alumno and materia
  Future<List<Map>> getNotasByDocente({required String idDocente}) async {
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

  Future<List<Map>> getNotasByCurso({required String idCurso}) async {
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
}
