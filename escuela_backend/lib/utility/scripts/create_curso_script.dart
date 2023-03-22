import 'dart:convert';
import 'dart:math';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  final anioLectivo = DateTime.now().year;
  final alumnos = await client.from("Alumno").select("idAlumno").execute().then(
      (res) => res.data
          .map<String>((alumno) => alumno['idAlumno'] as String)
          .toList());

  final asignaturaResponse = await client.from('Asignatura').select();

  final List asignaturas = await client
      .from('Asignatura')
      .select()
      .execute()
      .then((res) => res.data);

  // Crear registros de cursos
  for (var i = 1; i <= 6; i++) {
    final cursoName = '${i}erAnio ${anioLectivo}';
    final asignaturasCurso = asignaturas
        .where(
            (asignatura) => asignatura['nombre'].toString().contains('${i}°'))
        .map((asignatura) => asignatura['idAsignatura'])
        .toList();
    final alumnosCurso = _obtenerAlumnosAleatorios(alumnos, 15);
    alumnos.removeWhere((alumno) => alumnosCurso.contains(alumno));

    final response = await client.from('Curso').insert({
      'nombre': cursoName,
      'asignaturas': asignaturasCurso,
      'anioLectivo': anioLectivo,
      'alumnos': alumnosCurso,
      'active': true,
    }).execute();

    if (response.error != null) {
      print(response.error!.message);
    } else {
      print('Curso $cursoName creado');
    }
  }
}

// Función para obtener alumnos aleatorios
List<String> _obtenerAlumnosAleatorios(List<dynamic> alumnos, int cantidad) {
  final random = Random();
  final alumnosAleatorios = <String>[];

  while (alumnosAleatorios.length < cantidad) {
    final index = random.nextInt(alumnos.length);
    alumnosAleatorios.add(alumnos[index]);
  }

  return alumnosAleatorios;
}
