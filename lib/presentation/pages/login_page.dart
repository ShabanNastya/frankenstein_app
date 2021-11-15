import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frankenstein_app/domain/validator/validator_mixin.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_bloc.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_state.dart';
import 'package:frankenstein_app/presentation/pages/plan_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidatorMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginSuccessState) {
          return PlanPage();
        }
        if (state is LoginLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoginErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        return Scaffold(
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Login Page'),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'E-mail',
                      hintText: 'Input e-mail'),
                  validator: validateEmail,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Input password'),
                  validator: validatePassword,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed('/plan');
                      }
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        );
      }),
    );
  }
}
