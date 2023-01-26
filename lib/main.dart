import 'package:applaudo/auth_flow.dart';
import 'package:applaudo/environments/enviroment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void initApp(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initEnv(environment);
  runApp(const AuthFlow());
}

Future<void> _initEnv(AppEnvironment environment) async {
  switch (environment) {
    case AppEnvironment.dev:
      await dotenv.load(fileName: 'dev.env');
      break;
    case AppEnvironment.stag:
      await dotenv.load(fileName: 'stag.env');
      break;
    case AppEnvironment.prod:
      await dotenv.load(fileName: 'prod.env');
      break;
    default:
      await dotenv.load(fileName: 'prod.env');
  }
}
