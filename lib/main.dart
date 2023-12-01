import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/views/_home.dart';

import 'controllerBinding.dart';

void main() {
  ControllerBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Estacionamento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}
