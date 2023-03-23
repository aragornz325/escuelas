import 'base_repository.dart';

class CursoRepository extends Repository {

  Future<Map<String, dynamic>> createCurso({
    required Map<String, dynamic> nuevoCurso,
    }) async {

    final query = await client
      .from('Curso')
      .insert(nuevoCurso)
        .execute();

    if (query.error != null) {
      throw Exception("Error: ${query.error!.message}");
    } else {
      return query.data[0];
    }

  }

  Future<List<dynamic>> createCursosBulk({
    required List<Map<String, dynamic>> cursos,
    }) async {

    final query = await client
      .from('Curso')
      .insert(cursos)
        .execute();

    if (query.error != null) {
      throw Exception("Error: ${query.error!.message}");
    } else {
      return query.data;
    }

  }

  Future<List<dynamic>> getAllCursos() async {

    final query = await client
      .from('Curso')
      .select()
      .execute();

    if (query.error != null) {
      throw Exception("Error: ${query.error!.message}");
    } else {
      return query.data;
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

  Future<Map<String, dynamic>> updateCurso({
    required String idCurso,
    required Map<String, dynamic> curso,
    }) async {
    
    if (curso['idCurso'] != null) {
      throw Exception("Error: idCurso no debe ir dentro del parametro 'curso'. Debe ir solamente en 'idCurso'.");
    }

    final query = await client
      .from('Curso')
      .update(curso)
      .eq('idCurso', idCurso)
      .execute();

    if (query.error != null) {
      throw Exception("Error: ${query.error!.message}");
    } else {
      return query.data[0];
    }

  }
  
}
