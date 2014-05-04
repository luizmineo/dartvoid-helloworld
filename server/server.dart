import 'dart:io';

import 'package:bloodless/server.dart' as app;
import 'package:logging/logging.dart';

var logger = new Logger("hello_world");

@app.Route("/hello")
helloWorld(@app.QueryParam() String name) {

  if (name != null) {
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

  app.start(port: portEnv != null ? portEnv : 8080);

}
