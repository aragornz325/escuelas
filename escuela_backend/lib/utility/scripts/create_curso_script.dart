import 'dart:convert';
import 'dart:math';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  try {
    for (var i = 0; i < cursos.length; i++) {
      final response = await client.from('Curso').insert([
        {
          'nombre': cursos[i],
        }
      ]).execute();
      print('crete curso $i');
    }
    return 'all done';
  } catch (e) {
    print(e);
  }
}

List<String> cursos = [
  '1erGrado',
  '2doGrado',
  '3erGrado',
  '4toGrado',
  '5toGrado',
  '6toGrado',
  '1erAnio',
  '2doAnio',
  '3erAnio',
  '4toAnio',
  '5toAnio',
  '6toAnio'
];
