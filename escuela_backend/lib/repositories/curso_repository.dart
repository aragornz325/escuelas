import 'base_repository.dart';

class CursoRepository extends Repository {

  createCurso({
    required String nombre,
    required List<dynamic> asignaturasCurso,
    required int anioLectivo,
    required List<dynamic> alumnosCurso,
    }) async {

    try{

      final query = await client
        .from('Curso')
        .insert({
          'nombre':nombre,
          'asignaturas': asignaturasCurso,
          'anioLectivo': anioLectivo,
          'alumnos': alumnosCurso,
          })
          .execute();

      if (query.error != null) {
        return query.error!.message;
      } else {
        return query.data[0];
      }

    } catch (e) {
      return {
        'error' : e
      };
    }

  }
  
}
