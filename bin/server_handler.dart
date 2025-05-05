import 'package:shelf/shelf.dart';
import "package:shelf_router/shelf_router.dart";

class ServeHandler {
  // Define the HTTP handler.
  Handler get handler {
    final router = Router();

    // Define a route for the root path.
    router.get("/", (Request request) {
      return Response(200, body: "First Router");
    });

    // Return the router's handler.
    return router.call;
  }
}
