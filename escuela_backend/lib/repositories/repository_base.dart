import 'package:supabase/supabase.dart';

/// Repositorio base donde se instancia el cliente de Supabase.
abstract class Repository {
  static late SupabaseClient globalClient;

  SupabaseClient get client => globalClient;
}
