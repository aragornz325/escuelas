import 'package:escuelas/profesor/ui/screen/page_profesor.dart';
import 'package:escuelas/src/full_responsive/full_responsive_app.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FullResponsiveApp(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Agregado de la fuente al theme, para facil acceso
    final fuenteGeneral = GoogleFonts.nunito(fontWeight: FontWeight.w600);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: fuenteGeneral.fontFamily),
      home: const PageProfesor(),

      // builder: (context, child) {
      //   return const PageProfesor() ;
      // },
    );
  }
}
