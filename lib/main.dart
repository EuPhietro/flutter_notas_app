import 'package:flutter/material.dart';

import 'package:my_app_flutter/telas/form_screean.dart';
import 'telas/initial_scream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/initialPage",
      routes: {
        "/initialPage": (context) => const InitialScreen(),
        "/formPage": (context) => const FormPage(),
      },
    );
  }
}
