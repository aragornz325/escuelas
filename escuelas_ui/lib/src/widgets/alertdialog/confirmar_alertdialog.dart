import 'package:escuelas_ui/src/widgets/escuelas_boton_confirmar.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:flutter/material.dart';

class EscuelaAlertDialogConfirmar extends StatelessWidget {
  const EscuelaAlertDialogConfirmar({
    super.key,
    required this.ontap,
  });
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.ph,
      width: 300.pw,
      child: Column(
        children: [
          Text(
            'Las notas asignadas no pódran modificarse a un futuro',
            style: TextStyle(
              fontSize: 15.pf,
              color: Colors.grey,
            ),
          ),
          Text(
            '¿Deseas coninuar?',
            style: TextStyle(
              fontSize: 15.pf,
              color: Colors.grey,
            ),
          ),
          BotonConfirmar(
            datosCargados: true,
            onTap: ontap,
          ),
        ],
      ),
    );
  }
}
