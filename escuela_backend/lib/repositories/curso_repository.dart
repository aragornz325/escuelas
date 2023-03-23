import 'base_repository.dart';

class CursoRepository extends Repository {
  createCurso({
    required String nombre,
    required List<dynamic> asignaturasCurso,
    required int anioLectivo,
    required List<dynamic> alumnosCurso,
  }) async {
    try {
      final query = await client.from('Curso').insert({
        'nombre': nombre,
        'asignaturas': asignaturasCurso,
        'anioLectivo': anioLectivo,
        'alumnos': alumnosCurso,
      }).execute();

      if (query.error != null) {
        return query.error!.message;
      } else {
        return query.data[0];
      }
    } catch (e) {
      return {'error': e};
    }
  }

  Future<Map> getCursoByAsignatura(idAsignatura) async {
    final allCursos = await client.from('Curso').select().execute();
    if (allCursos.error != null) {
      throw Exception(allCursos.error!.message);
    }
    if (allCursos.data.isEmpty) {
      throw Exception('no se encontro el curso');
    }
    final List cursosaFiltrar = allCursos.data;
    final List curso = [];
    cursosaFiltrar.forEach((element) {
      if (element['asignaturas'].contains(idAsignatura)) {
        curso.add(element);
      }
    });

    return curso[0];
  }
}
