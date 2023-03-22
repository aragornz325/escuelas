import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:escuela_backend/controllers/mailer_controller.dart';

class MailerRouter {
  final MailerController _mailerController;

  MailerRouter(this._mailerController);

  Router get router {
    final router = Router();

    router.post('/<id>', (Request request, String id) {
      return _mailerController.sendMail(request, id);
    });

    return router;
  }
}
