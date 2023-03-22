import 'package:supabase/supabase.dart';
import 'dart:io';

class NotaRepository {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  /// get notas by idDocente, populate with alumno and materia
  getNotasByDocente({required String idDocente}) async {
    final response = await client
        .from('Nota')
        .select(
            'nota, Alumno:idAlumno(nombre, apellido, email), Asignatura:idAsignatura(nombre), Curso:idCurso(nombre)')
        .eq('idDocente', idDocente)
        .execute();

    final notasByAlumno = <String, Map<String, dynamic>>{};

    for (final nota in response.data) {
      final nombreAlumno = nota['Alumno']['nombre'] as String;

      // ignore: avoid_single_cascade_in_expression_statements
      notasByAlumno.putIfAbsent(
          nombreAlumno,
          () => {
                'nombre': nombreAlumno,
                'apellido': nota['Alumno']['apellido'],
                'email': nota['Alumno']['email'],
                'notas': [],
              })
        ..['notas'].add({
          'asignatura': nota['Asignatura']['nombre'],
          'curso': nota['Curso']['nombre'],
          'nota': nota['nota'],
        });
    }

    return notasByAlumno.values.toList();
  }

  getNotasByCurso({required String idCurso}) async {
    final response = await client
        .from('Nota')
        .select(
            'nota, Alumno:idAlumno(nombre, apellido, email), Asignatura:idAsignatura(nombre), Curso:idCurso(nombre)')
        .eq('idCurso', idCurso)
        .execute();

    final notasByAlumno = <String, Map<String, dynamic>>{};

    for (final nota in response.data) {
      final nombreAlumno = nota['Alumno']['nombre'] as String;

      // ignore: avoid_single_cascade_in_expression_statements
      notasByAlumno.putIfAbsent(
          nombreAlumno,
          () => {
                'nombre': nombreAlumno,
                'apellido': nota['Alumno']['apellido'],
                'email': nota['Alumno']['email'],
                'notas': [],
              })
        ..['notas'].add({
          'asignatura': nota['Asignatura']['nombre'],
          'curso': nota['Curso']['nombre'],
          'nota': nota['nota'],
        });
    }

    return notasByAlumno.values.toList();
  }
}
