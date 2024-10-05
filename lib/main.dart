import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_list/app.dart';
import 'core/flavors.dart';
import 'injection.dart' as di;
import '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String appFlavor = String.fromEnvironment('APP_FLAVOR', defaultValue: 'dev');
  setFlavor(appFlavor);
  await di.init();
  await dotenv.load(fileName: ".env");
  runApp(MovieApp());
}
