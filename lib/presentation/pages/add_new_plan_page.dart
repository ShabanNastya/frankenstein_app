import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewPlan extends StatefulWidget {
  const AddNewPlan({Key? key}) : super(key: key);

  @override
  _AddNewPlanState createState() => _AddNewPlanState();
}

class _AddNewPlanState extends State<AddNewPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Date'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('Cancel')),
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}
