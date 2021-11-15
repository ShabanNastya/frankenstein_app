import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frankenstein_app/domain/validator/validator_mixin.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_bloc.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_event.dart';
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
    return Scaffold(
      body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child:
              BlocBuilder<LoginBloc, LoginPageState>(builder: (context, state) {
            switch (state.status) {
              case PageStatus.initial:
                return Form(
                  key: formKey,
                  //autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Login Page'),
                      TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'E-mail',
                              hintText: 'Input e-mail'),
                          //validator: validateEmail,
                          onChanged: (newValue) {
                            context
                                .read<LoginBloc>()
                                .add(EmailChanged(newValue));
                          }),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Password',
                            hintText: 'Input password'),
                        //validator: validatePassword,
                        onChanged: (newValue) {
                          context
                              .read<LoginBloc>()
                              .add(PasswordChanged(newValue));
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context).pushNamed('/plan');
                            }
                          },
                          child: const Text('Login'))
                    ],
                  ),
                );

              case PageStatus.error:
                return const Center(
                  child: Text('Error'),
                );
              case PageStatus.success:
                return const PlanPage();
              case PageStatus.loading:
                return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
