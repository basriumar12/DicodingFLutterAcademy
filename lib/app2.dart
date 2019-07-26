import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/app_config.dart';

void main() {
  var configuredApp = AppConfig(
    appTitle: "List Meal App 2",
    buildFlavor: "app2",
    child: MyApp(),
  );

  runApp(configuredApp);
}