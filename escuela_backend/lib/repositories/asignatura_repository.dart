import 'dart:async';

import 'package:supabase/supabase.dart';
import 'dart:io';

class AsignaturaRepository {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  getAsignaturaById(idAsignatura) async {
    try {
      final response = await client
          .from('Asignatura')
          .select('*, docente(*)')
          .eq('idAsignatura', idAsignatura)
          .execute();
      if (response.error != null) {
        return {
          "error": response.error?.message,
        };
      } else {
        return response.data[0];
      }
    } catch (e) {
      return {
        "error": e,
      };
    }
  }
}