import 'base_repository.dart';

class AsignaturaRepository extends Repository {
  Future<Map> getAsignaturaById(idAsignatura) async {
    final response = await client
        .from('Asignatura')
        .select('*, docente(*)')
        .eq('idAsignatura', idAsignatura)
        .execute();

    if (response.data.isEmpty) {
      throw Exception('no se encontro la asignatura');
    }
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return response.data[0];
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
