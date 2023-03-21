import 'dart:convert';
import 'dart:math';
import 'package:supabase/supabase.dart';

main(List<String> args) async {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  try {
    //get all id alumnos
    final alumnosResponse =
        await client.from('Alumno').select('idAlumno').execute();
    final alumnosid = alumnosResponse.data.map((e) => e['idAlumno']).toList();
    final asignaturaResponse =
        await client.from('Asignatura').select('idAsignatura').execute();
    final asignaturaid =
        asignaturaResponse.data.map((e) => e['idAsignatura']).toList();
    final docenteResponse =
        await client.from('Docente').select('idDocente').execute();
    final docenteid = docenteResponse.data.map((e) => e['idDocente']).toList();
    final divisionResponse =
        await client.from('Division').select('idDivision').execute();
    final divisionid =
        divisionResponse.data.map((e) => e['idDivision']).toList();
    final cursoResponse =
        await client.from('Curso').select('idCurso').execute();
    final cursoid = cursoResponse.data.map((e) => e['idCurso']).toList();

    List<Map<String, dynamic>> notaMapArray = [];
    for (var i = 0; i < 300; i++) {
      Map<String, dynamic> notaMap = {
        "nota": Random().nextInt(10) + 1,
        "idAlumno": alumnosid[Random().nextInt(alumnosid.length)],
        "idDocente": docenteid[Random().nextInt(docenteid.length)],
        "idCurso": cursoid[Random().nextInt(cursoid.length)],
        "idAsignatura": asignaturaid[Random().nextInt(asignaturaid.length)],
        "idDivision": divisionid[Random().nextInt(divisionid.length)],
        "Periodo": 7,
      };

      notaMapArray.add(notaMap);
    }

    final response = await client.from('Nota').insert(notaMapArray).execute();
    //if response.error exist imprim error
    if (response.error != null) {
      print(response.error);
    } else {
      print(response.data);
    }

    return 'Notas creadas';
  } catch (e) {
    print(e);
  }
}
