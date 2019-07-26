import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/app_config.dart';

void main() {
  var configuredApp = AppConfig(
    appTitle: "List Meal App 1",
    buildFlavor: "app1",
    child: MyApp(),
  );

  runApp(configuredApp);
}