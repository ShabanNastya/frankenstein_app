import 'package:flutter/material.dart';
import 'package:frankenstein_app/presentation/pages/login_page.dart';
import 'package:frankenstein_app/presentation/pages/plan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LoginPage(),
        '/plan': (BuildContext context) => const PlanPage(),
      },
    );
  }
}
