import 'package:shelf/shelf_io.dart' as shelf_io;

// Import the custom server handler.
import 'server_handler.dart' as sh;

void main() async {
  // Create an instance of the server handler.
  var _server = sh.ServeHandler();

  // Start the server on localhost at port 8080.
  final server = await shelf_io.serve(_server.handler, "localhost", 8080);

  // Log the server address to the console.
  print("Server started ${server.address}");
}
