import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:escuelas_ui/escuelas_ui.dart';

class PageProfesor extends StatelessWidget {
  const PageProfesor({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewProfesor();
  }
}

class ViewProfesor extends StatefulWidget {
  const ViewProfesor({super.key});

  @override
  State<ViewProfesor> createState() => _ViewProfesorState();
}

class _ViewProfesorState extends State<ViewProfesor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.pw),
        child: Column(
          children: [
            SizedBox(height: 65.ph),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lengua',
                  style: TextStyle(
                      fontSize: 24.pf, color: const Color(0xff1e1e1e)),
                ),
                Text(
                  '1ERO A',
                  style: TextStyle(
                      fontSize: 24.pf, color: const Color(0xff6D6D6D)),
                ),
              ],
            ),
            SizedBox(
              height: 20.ph,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nombre del alumno/a',
                  style: TextStyle(
                      fontSize: 13.pf, color: const Color(0xff6D6D6D)),
                ),
                // SizedBox(
                //   width: 160.pw,
                // ),
                Text(
                  'Nota',
                  style: TextStyle(
                      fontSize: 13.pf, color: const Color(0xff6D6D6D)),
                )
              ],
            ),
            SizedBox(height: 10.ph),
            SizedBox(
              height: 430.ph,
              child: const SingleChildScrollView(),
            ),
            //TODO: cambiar por widgets de botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotonBorrarTodo(onTap: () {}, datosCargados: true),
                BotonConfirmar(datosCargados: true, onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
