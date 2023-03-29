import 'package:test/test.dart';
import 'package:escuela_backend/services/mailer_service.dart';

void main() {
  final _mailerService = MailerService();
  group('sendMailByCurso', () {
    test('Debería enviar correo con notas válidas', () async {
      final result = await _mailerService.sendMailByCurso(idCurso: '123');
      expect(result, {'status': 'ok'});
    });

    test('Debería lanzar una excepción si no hay notas', () async {
      expect(
        () async => await _mailerService.sendMailByCurso(idCurso: '456'),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'toString()',
          'Exception: No hay notas para enviar',
        )),
      );
    });
  });
}
