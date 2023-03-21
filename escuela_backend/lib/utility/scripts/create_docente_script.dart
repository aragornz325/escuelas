import 'dart:convert';
import 'dart:math';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  try {
    for (int i = 0; i < 50; i++) {
      String nombreDocente = nombreA[Random().nextInt(nombreA.length)];
      String apellidoDocente = apellidoA[Random().nextInt(apellidoA.length)];

      final response = await client.from('Docente').insert([
        {'nombre': nombreDocente, 'apellido': apellidoDocente}
      ]).execute();
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}

List<String> nombreA = [
  "Lars",
  "Erik",
  "Hans",
  "Ingrid",
  "Greta",
  "Bjorn",
  "Johan",
  "Kirsten",
  "Maja",
  "Sven",
  "Oskar",
  "Viggo",
  "Freja",
  "Kari",
  "Lena"
];

List<String> apellidoA = [
  "Andersson",
  "Johansson",
  "Larsson",
  "Nilsson",
  "Svensson",
  "Pettersson",
  "Carlsson",
  "Gustafsson",
  "Eriksson",
  "Lindberg",
  "Persson",
  "Olsson",
  "Berg",
  "Hansen",
  "Jensen"
];
