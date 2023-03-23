import 'package:shelf_router/shelf_router.dart';
import 'package:escuela_backend/router/user_router.dart';
import 'package:escuela_backend/controllers/user_controller.dart';
import 'package:escuela_backend/router/mailer_router.dart';
import 'package:escuela_backend/controllers/mailer_controller.dart';
import 'package:escuela_backend/router/link_router.dart';
import 'package:escuela_backend/controllers/link_controller.dart';

class EscuelasRouter {
  final _router = Router();

  EscuelasRouter() {
    final userController = UserController();
    final userRouter = UserRouter(userController);
    final mailerController = MailerController();
    final mailerRouter = MailerRouter(mailerController);
    final linkController = LinkController();
    final linkRouter = LinkRouter(linkController);

    _router.mount('/users', userRouter.router);
    _router.mount('/link', linkRouter.router);
    _router.mount('/mailer', mailerRouter.router);
  }

  Router get router => _router;
}
