import 'dart:convert';
import 'dart:math';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  try {
    List<Map<String, String>> usuarios = [];
    // List<Map<String, String>> usuarios2 = [];
    // List<Map<String, String>> usuarios3 = [];

    // Generamos 150 usuarios con el email rodrigo.m.quintero@gmail.com
    for (int i = 0; i < 150; i++) {
      String nombre = nombresHispanos[Random().nextInt(nombresHispanos.length)];
      String apellido =
          apellidosHispanos[Random().nextInt(apellidosHispanos.length)];
      String email = "rodrigo.m.quintero@gmail.com";
      Map<String, String> usuario = {
        "nombre": nombre,
        "apellido": apellido,
        "email": email
      };
      usuarios.add(usuario);
    }

    // Generamos 150 usuarios con el email juanjgar998@gmail.com
    for (int i = 0; i < 150; i++) {
      String nombre = nombresHispanos[Random().nextInt(nombresHispanos.length)];
      String apellido =
          apellidosHispanos[Random().nextInt(apellidosHispanos.length)];
      String email = "juanjgar998@gmail.com";
      Map<String, String> usuario = {
        "nombre": nombre,
        "apellido": apellido,
        "email": email
      };
      usuarios.add(usuario);
    }

    // Generamos 100 usuarios con el email lucas.olimpi@gmail.com
    for (int i = 0; i < 100; i++) {
      String nombre = nombresHispanos[Random().nextInt(nombresHispanos.length)];
      String apellido =
          apellidosHispanos[Random().nextInt(apellidosHispanos.length)];
      String email = "lucas.olimpi@gmail.com";
      Map<String, String> usuario = {
        "nombre": nombre,
        "apellido": apellido,
        "email": email
      };
      usuarios.add(usuario);
    }

    // Convertimos la lista de usuarios a formato JSON

    // Insertamos los usuarios en la base de datos

    for (var i = 0; i < usuarios.length; i++) {
      final response = await client.from('Alumno').insert([
        {
          'nombre': usuarios[i]['nombre'],
          'apellido': usuarios[i]['apellido'],
          'email': usuarios[i]['email'],
        }
      ]).execute();
      print('create alumno $i');
    }

    return "Usuarios creados";
  } catch (e) {
    print(e);
  }
}

List<String> nombresHispanos = [
  "Sofía",
  "Juan",
  "Valentina",
  "Pedro",
  "Isabella",
  "Luis",
  "Camila",
  "Andrés",
  "Natalia",
  "Joaquín",
  "Gabriela",
  "Francisco",
  "Carolina",
  "Emilio",
  "Juliana",
  "Alejandro",
  "Florencia",
  "Miguel",
  "Paola",
  "Rafael",
  "Ana",
  "Diego",
  "Mónica",
  "Gustavo",
  "Lucía",
  "Pablo",
  "María",
  "Renata",
  "Antonio",
  "Laura",
  "Santiago",
  "Angélica",
  "Federico",
  "Sara",
  "Matías",
  "Daniela",
  "Javier",
  "Adriana",
  "Carlos",
  "Patricia",
  "José",
  "Verónica",
  "Lucas",
  "Cristina",
  "Manuel",
  "Isabel",
  "Tomás",
  "Estefanía",
  "Hernán",
  "Valeria",
  "Martín",
  "Olga"
];

List<String> apellidosHispanos = [
  "González",
  "Rodríguez",
  "García",
  "Fernández",
  "López",
  "Díaz",
  "Martínez",
  "Sánchez",
  "Pérez",
  "Gómez",
  "Romero",
  "Sosa",
  "Álvarez",
  "Torres",
  "Ruiz",
  "Ramírez",
  "Flores",
  "Acosta",
  "Rojas",
  "Molina",
  "Hernández",
  "Suárez",
  "Silva",
  "Vega",
  "Cruz",
  "Moreno",
  "Ortiz",
  "Gutiérrez",
  "Castro",
  "Ortega",
  "Núñez",
  "Rivas",
  "Soto",
  "Vargas",
  "Reyes",
  "Guerrero",
  "Vázquez",
  "Cabrera",
  "Medina",
  "León",
  "Miranda",
  "Méndez",
];
