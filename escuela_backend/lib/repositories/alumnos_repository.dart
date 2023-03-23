import 'base_repository.dart';

class AlumnoRepository extends Repository {
  Future<List> getAlumnosBash(List alumnos) async {
    final alumnosResponse = await client
        .from('Alumno')
        .select('idAlumno, nombre, apellido')
        .in_('idAlumno', alumnos)
        .execute();
    final alumnoss = alumnosResponse.data;
    if (alumnosResponse.error != null) {
      throw Exception(alumnosResponse.error!.message);
    }
    return alumnosResponse.data;
  }
}
