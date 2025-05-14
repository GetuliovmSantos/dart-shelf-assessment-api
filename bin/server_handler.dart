import 'dart:convert';

import 'package:shelf/shelf.dart';
import "package:shelf_router/shelf_router.dart";

class ServeHandler {
  // Define the HTTP handler.
  Handler get handler {
    final router = Router();

    // Route for the root path.
    router.get("/", (Request req) {
      return Response.ok("First Router");
    });

    // Route with a dynamic user parameter.
    router.get("/user/<user>", (Request req, String user) {
      return Response.ok("Hello $user!");
    });

    // Route with a query parameter for user.
    router.get("/user", (Request req) {
      String? user = req.url.queryParameters["user"];
      return Response.ok("Hello $user!");
    });

    // Route for login.
    router.post('/login', (Request req) async {
      Map res = jsonDecode(await req.readAsString());

      if (res["name"] == "Admin" && res["password"] == 123) {
        return Response.ok("Welcome ${res["name"]}");
      } else {
        return Response.forbidden("Error");
      }
    });

    // Return the router's handler.
    return router.call;
  }
}
