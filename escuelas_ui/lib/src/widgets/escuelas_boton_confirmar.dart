import 'package:flutter/material.dart';

import 'package:full_responsive/full_responsive.dart';

import '../../escuelas_ui.dart';

class BotonConfirmar extends StatelessWidget {
  const BotonConfirmar({
    super.key,
    required this.onTap,
    this.height = 37,
    this.width = 150,
    required this.datosCargados,
  });

  ///Width del container que va a funcionar como boton
  final double? width;

  ///Height del container que va a funcionar como boton
  final double? height;

  ///Voidcallback del boton
  final VoidCallback onTap;

  final bool datosCargados;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23)),
          color: datosCargados
              ? EscuelasColor.confirmar
              : EscuelasColor.inhabilitado,
        ),
        width: width ?? 150.pw,
        height: height ?? 37.ph,
        //TODO: agregar las constantes cuando esten hechas

        child: Center(
          child: Text(
            'CONFIRMAR',
            style: TextStyle(fontSize: 14.pf, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
