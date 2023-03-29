import 'base_repository.dart';

class LinkRepository extends Repository {
  ///esta funcion crea un registro de un link de calificaciones
  ///recibe el token, el periodo y el id del docente
  Future<Map> createLinkRegister(
      {required String token,
      required String periodo,
      required String idDocente,
      required String idAsignatura}) async {
    final registro = {
      'idDocente': idDocente,
      'notasCargadas': false,
      'emailEnviado': false,
      'periodo': periodo,
      'active': true,
      'token': token,
      'idAsignatura': idAsignatura,
    };
    final response = await client.from('Enlace').insert(registro).execute();

    if (response.error != null) {
      throw Exception(response.error);
    }

    if (response.data == null) {
      throw Exception('No se pudo crear el registro');
    }
    return response.data[0];
  }

  ///esta funcion devuelve todos los link de calificaciones
  ///generados para un docente y un periodo especifico
  ///DEVUELVE SOLO LOS ACTIVOS
  Future<List> getLinkByDocenteAndPeriodoAndAsignatura(
      {required String idDocente,
      required String periodo,
      required String idAsignatura}) async {
    final response = await client
        .from('Enlace')
        .select('*, Docente(*)')
        .eq('idDocente', idDocente)
        .eq('periodo', periodo)
        .eq('active', true)
        .eq('idAsignatura', idAsignatura)
        .execute();

    if (response.error != null) {
      throw Exception(response.error);
    }
    return response.data;
  }

  ///esta funcion devuelve un link por su token
  ///devuelve un solo registro, sin importar su condicion active
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

  ///esta funcion actualiza el registro de un link
  ///recibe el id del link y el registro a actualizar
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

  ///esta funcion devuelve todos lo link de calificaciones
  ///generados para un periodo especifico
  ///devuelve totos, sin importar su condicion active
  Future<List> getLinksByPeriodo(String periodo) async {
    final response = await client
        .from('Enlace')
        .select('*, Docente(*)')
        .eq('periodo', periodo)
        .eq('active', true)
        .execute();

    if (response.error != null) {
      throw Exception(response.error);
    }
    return response.data;
  }
}
