import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:escuela_backend/controllers/link_controller.dart';

class LinkRouter {
  final LinkController _linkController;

  LinkRouter(this._linkController);

  Router get router {
    final router = Router();

    router.post('/<idAsignatura>', (
      Request request,
    ) {
      return _linkController.sendLinkByAsignatura(request);
    });

    router.get('/<token>', (Request request) {
      return _linkController.sendAlumnosByToken(request);
    });

    return router;
  }
}
