import 'dart:convert';
import 'dart:math';
import 'package:escuela_backend/utility/scripts/create_asignatura.dart';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  const String anioBusqueda = '6erAnio 2023';
  const int periodo = 1;

  // Obtener el ID del curso correspondiente según el año
  final responseCurso = await client
      .from('Curso')
      .select('idCurso')
      .eq('nombre', anioBusqueda)
      .single()
      .execute();

  final idCurso = responseCurso.data['idCurso'];

  final cursoResponse = await client
      .from('Curso')
      .select('alumnos, asignaturas')
      .eq('nombre', anioBusqueda)
      .single() // Obtener la lista de alumnos y asignaturas correspondientes al curso
      .execute();

  final curso = cursoResponse.data;
  final List notaBash = [];

  // Iterar sobre cada alumno y asignatura del curso
  for (final idAlumno in curso['alumnos']) {
    for (final idAsignatura in curso['asignaturas']) {
      final responseAsignatura = await client
          .from('Asignatura')
          .select('docente')
          .eq('idAsignatura', idAsignatura)
          .single()
          .execute(); // Obtener la asignatura correspondiente

      final asignatura = responseAsignatura.data;

      final idDocente = asignatura['docente'];

      final nota = Random().nextInt(10) + 1;

      // Insertar la nota en la tabla de "notas"

      notaBash.add(
        {
          'nota': nota,
          'idAlumno': idAlumno,
          'idDocente': idDocente,
          'idCurso': idCurso,
          'idAsignatura': idAsignatura,
          'periodo': periodo,
        },
      );
    }
  }
  final responseNota = await client
      .from('Nota')
      .insert(notaBash)
      .execute(); // Insertar la nota en la tabla de "notas"

  if (responseNota.error != null) {
    print(responseNota.error!.message);
  }
  print(responseNota.data);
  return 'all done';
}
