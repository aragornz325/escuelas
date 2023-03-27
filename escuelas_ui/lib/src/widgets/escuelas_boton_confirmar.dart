import 'package:flutter/material.dart';

import 'package:full_responsive/full_responsive.dart';

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
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(23))),
        width: width!.pw,
        height: height!.ph,
        //TODO: agregar las constantes cuando esten hechas
        color: datosCargados ? Color(0xff62B446) : Color(0xffC0C0C0),
        child: Center(
          child: Text(
            'CONFIRMAR',
            style: TextStyle(fontSize: 14.pf),
          ),
        ),
      ),
    );
  }
}
