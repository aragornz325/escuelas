import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:escuela_backend/controllers/calificacion_controller.dart';

class CalificacionRouter {
  final CalificacionController _calificacionController;

  CalificacionRouter(this._calificacionController);

  Router get router {
    final router = Router();

    router.post('/', (Request request) {
      return _calificacionController.createCalificacionInBash(request);
    });

    return router;
  }
}
