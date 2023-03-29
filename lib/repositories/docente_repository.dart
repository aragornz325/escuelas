import 'package:escuela_backend/repositories/base_repository.dart';

class DocenteRepository extends Repository {
  Future<Map> getDocenteById({required String idDocente}) async {
    final response = await client
        .from('Docente')
        .select()
        .eq('idDocente', idDocente)
        .execute();

    if (response.data.isEmpty) {
      throw Exception('no se encontro el docente');
    }
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return response.data[0];
  }
}
