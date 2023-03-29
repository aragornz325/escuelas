import 'package:dotenv/dotenv.dart' show DotEnv;
import 'package:escuela_backend/repositories/repositories.dart';

initsupabaseClient() async {
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load();
  Repository.globalClient = SupabaseClient(
    dotEnv['SUPABASE_URL']!,
    dotEnv['SUPABASE_KEY']!,
  );
}
