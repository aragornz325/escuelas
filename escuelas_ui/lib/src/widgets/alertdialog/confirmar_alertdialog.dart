import 'package:escuelas_ui/src/widgets/escuelas_boton_confirmar.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:flutter/material.dart';

///Alert Dialgo que se muesta al confirmar la nota como aviso
class EscuelaAlertDialogConfirmar extends StatelessWidget {
  const EscuelaAlertDialogConfirmar({
    super.key,
    required this.ontap,
  });

  ///Accion que hace al confirmar en [EscuelaAlertDialogConfirmar].
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 135.ph,
        width: 273.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Las notas asignadas no pódran modificarse a un futuro.',
              style: TextStyle(
                fontSize: 15.pf,
                color: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '¿Deseas continuar?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.pf,
                  color: Colors.grey,
                ),
              ),
            ),
            Spacer(),
            BotonConfirmar(
              datosCargados: true,
              onTap: ontap,
            ),
          ],
        ),
      ),
    );
  }
}
