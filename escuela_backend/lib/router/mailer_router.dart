import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:escuela_backend/controllers/mailer_controller.dart';

class MailerRouter {
  final MailerController _mailerController;

  MailerRouter(this._mailerController);

  Router get router {
    final router = Router();

    router.post('/bydocente/<id>', (Request request, String id) {
      return _mailerController.sendMailByDocente(request, id);
    });

    router.post('/bycurso/<id>', (Request request, String id) {
      return _mailerController.sendMailByCurso(request, id);
    });

    return router;
  }
}
