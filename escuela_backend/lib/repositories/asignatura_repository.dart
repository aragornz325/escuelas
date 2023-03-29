import 'package:shelf/shelf.dart';

import 'base_repository.dart';

class AsignaturaRepository extends Repository {
  Future<Map> getAsignaturaById({required String idAsignatura}) async {
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
}
