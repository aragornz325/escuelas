import 'dart:convert';
import 'dart:math';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  try {
    final docenteResponse =
        await client.from('Docente').select('idDocente').execute();
    final docenteid = docenteResponse.data.map((e) => e['idDocente']).toList();

    for (var i = 0; i < asignaturas.length; i++) {
      final response = await client.from('Asignatura').insert([
        {
          'nombre': asignaturas[i],
          'docente': docenteid[Random().nextInt(docenteid.length)],
        }
      ]).execute();
      print('crete asignaturas $i');
    }
    return 'all done';
  } catch (e) {
    print(e);
  }
}

List<String> asignaturas = [
  "Matemática de 1°",
  "Ciencias sociales de 1°",
  "Ciencias naturales de 1°",
  "Ingles de 1°",
  "Educación artística de 1°",
  "Construcción de la ciudadanía de 1°",
  "Prácticas del lenguaje de 1°",
  "Educación física de 1°",
  "Ética (taller) de 1°",
  "Matemática de 2°",
  "Biología de 2°",
  "Geografía de 2°",
  "Prácticas del lenguaje de 2°",
  "Ingles de 2°",
  "Educación artística de 2°",
  "Fisicoquímica de 2°",
  "Historia de 2°",
  "Construcción de la ciudadanía de 2°",
  "Educación fisica de 2°",
  "Etica (taller) de 2°",
  "Matemática de 3°",
  "Biología de 3°",
  "Historia de 3°",
  "Geografía de 3°",
  "Ingles de 3°",
  "Prácticas del lenguaje de 3°",
  "Fisicoquímica de 3°",
  "Educación artística de 3°",
  "Construcción de la ciudadanía de 3°",
  "Educación fisica de 3°",
  "Etica (taller) de 3°",
  "Matemática de 4°",
  "Biología de 4°",
  "Física de 4°",
  "Salud y adolescencia de 4°",
  "Historia de 4°",
  "Geografía de 4°",
  "NTICX de 4°",
  "Literatura de 4°",
  "Inglés de 4°",
  "Psicología de 4°",
  "Educación física de 4°",
  "Ética (taller) de 4°",
  "Matemática de 5°",
  "Literatura de 5°",
  "Geografía de 5°",
  "Historia de 5°",
  "Inglés de 5°",
  "Política y ciudadanía de 5°",
  "Economía política de 5°",
  "Introducción a la química de 5°",
  "Comunicación, cultura y sociedad de 5°",
  "Sociología de 5°",
  "Educación física de 5°",
  "Ética (taller) de 5°",
  "Matemática de 6°",
  "Inglés de 6°",
  "Literatura de 6°",
  "Geografía de 6°",
  "Historia de 6°",
  "Trabajo y ciudadanía de 6°",
  "Proyecto de investigación de 6°",
  "Filosofía de 6°",
  "Arte de 6°",
  "Educación física de 6°",
  "Ética (taller) de 6°",
];
