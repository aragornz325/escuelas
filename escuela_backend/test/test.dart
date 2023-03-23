import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:escuela_backend/repositories/repositories.dart';

void main() async {
  
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

  Repository.globalClient = SupabaseClient(
    dotEnv['SUPABASE_URL']!,
    dotEnv['SUPABASE_KEY']!,
  );

  
  
  exit(0);
}