import 'base_repository.dart';

class AsignaturaRepository extends Repository {

  getAsignaturaById(idAsignatura) async {
    try {
      final response = await client
          .from('Asignatura')
          .select('*, docente(*)')
          .eq('idAsignatura', idAsignatura)
          .execute();
      if (response.error != null) {
        return {
          "error": response.error?.message,
        };
      } else {
        return response.data[0];
      }
    } catch (e) {
      return {
        "error": e,
      };
    }
  }
}
