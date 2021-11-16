import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:frankenstein_app/presentation/pages/add_new_plan_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context)!.hello;
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData == null) {
            return Center(
              child: Text(
                "No Data",
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Welcome to plan page'),
              ),
              body: Container(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNewPlan()));
                },
                child: Icon(Icons.add_task),
              ),
            );
          }
        });
  }
}
