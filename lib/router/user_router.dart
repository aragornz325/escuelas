import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:escuela_backend/controllers/user_controller.dart';

class UserRouter {
  final UserController _userController;

  UserRouter(this._userController);

  Router get router {
    final router = Router();

    router.post('/', (Request request) {
      return _userController.registerUser(request);
    });

    router.post('/login', (Request request) {
      return _userController.login(request);
    });

    return router;
  }
}
