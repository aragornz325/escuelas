import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:escuela_backend/controllers/link_controller.dart';

class LinkRouter {
  final LinkController _linkController;

  LinkRouter(this._linkController);

  Router get router {
    final router = Router();

    router.post('/<idAsignatura>', (Request request, String idAsignatura) {
      print('en el router entrando al controller');
      return _linkController.sendLinkByAsignatura(request, idAsignatura);
    });

    return router;
  }
}
