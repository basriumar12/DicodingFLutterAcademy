import 'package:flutter/material.dart';
import 'package:flutter_app/app_config.dart';
import 'package:flutter_app/screen/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: AppConfig.of(context).appTitle,
      home : Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//tasktwo patch-1
//void main() => runApp(MaterialApp(
//  home : Home(),
//  debugShowCheckedModeBanner: false,
//));
