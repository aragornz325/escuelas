import 'base_repository.dart';

class LinkRepository extends Repository {
  Future<Map> createLinkRegister(
      {required String token,
      required String periodo,
      required String idDocente}) async {
    final registro = {
      'idDocente': idDocente,
      'notasCargadas': false,
      'emailEnviado': false,
      'periodo': periodo,
      'active': true,
      'token': token,
    };
    final response = await client.from('Enlace').insert(registro).execute();
    print(response.data);

    if (response.error != null) {
      throw Exception(response.error);
    }

    if (response.data == null) {
      throw Exception('No se pudo crear el registro');
    }
    return response.data[0];
  }

  Future<List> getLinkByDocenteAndPeriodo(
      {required String idDocente, required String periodo}) async {
    final response = await client
        .from('Enlace')
        .select('*, Docente(*)')
        .eq('idDocente', idDocente)
        .eq('periodo', periodo)
        .eq('active', true)
        .execute();

    if (response.error != null) {
      throw Exception(response.error);
    }
    return response.data;
  }

  Future<Map> getLinkByToken(String token) async {
    final response =
        await client.from('Enlace').select().eq('token', token).execute();

    if (response.error != null) {
      throw Exception(response.error);
    }
    if (response.data.isEmpty) {
      throw Exception('No se encontro el link');
    }
    return response.data[0];
  }

  Future<Map> updateLinkRegister(
      {required String idEnlace, required Map registro}) async {
    final response = await client
        .from('Enlace')
        .update(registro)
        .eq('idEnlace', idEnlace)
        .execute();

    if (response.error != null) {
      throw Exception(response.error);
    }
    if (response.data == null) {
      throw Exception('No se pudo actualizar el registro');
    }
    return response.data[0];
  }
}
