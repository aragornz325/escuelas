import 'package:shelf_router/shelf_router.dart';
import 'package:escuela_backend/router/user_router.dart';
import 'package:escuela_backend/controllers/user_controller.dart';
import 'package:escuela_backend/router/mailer_router.dart';
import 'package:escuela_backend/controllers/mailer_controller.dart';
import 'package:escuela_backend/router/link_router.dart';
import 'package:escuela_backend/controllers/link_controller.dart';
import 'package:escuela_backend/router/calificacion_router.dart';
import 'package:escuela_backend/controllers/calificacion_controller.dart';

class EscuelasRouter {
  final _router = Router();

  EscuelasRouter() {
    _router.mount('/api/users', UserRouter(UserController()).router);
    _router.mount('/api/link', LinkRouter(LinkController()).router);
    _router.mount('/api/mailer', MailerRouter(MailerController()).router);
    _router.mount('/api/calificacion',
        CalificacionRouter(CalificacionController()).router);
  }

  Router get router => _router;
}
