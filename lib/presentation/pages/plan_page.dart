import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frankenstein_app/presentation/pages/add_new_plan_page.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to plan page'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewPlan()));
        },
        child: Icon(Icons.add_task),
      ),
    );
  }
}
