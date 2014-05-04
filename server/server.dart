import 'dart:io';

import 'package:bloodless/server.dart' as app;
import 'package:logging/logging.dart';

var logger = new Logger("hello_world");

@app.Route("/hello")
helloWorld(@app.QueryParam() String name) {

  if (name != null && !name.trim().isEmpty) {
    logger.info("Saying hello to $name");
    return "Hello $name";
  } else {
    logger.info("Saying hello to the world");
    return "Hello World!";  
  }

}

main() {

  app.setupConsoleLog();

  var portEnv = Platform.environment['PORT'];

  app.start(address: '127.0.0.1', 
            port: portEnv != null ? int.parse(portEnv) : 8080, 
            staticDir: null);

}
