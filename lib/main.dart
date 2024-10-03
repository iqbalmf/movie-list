import 'package:flutter/material.dart';
import 'package:test_moviedb/app.dart';
import 'package:test_moviedb/core/app_config.dart';
import 'injection.dart' as di;

void main() {
  ConstantsApp.setEnvironment(EnvirontmentApp.Dev);
  di.init();
  runApp(MovieApp());
}
