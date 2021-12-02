import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to plan page'),
      ),
    );
  }
}
