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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginPageState>(
                buildWhen: (p,c){
                  return p.email != c.email || p.password != c.password;
                },
                builder: (context, state) {

              switch (state.status) {
                case PageStatus.success:
                case PageStatus.loading:
                case PageStatus.initial:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Login Page'),
                      TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'E-mail',
                              hintText: 'Input e-mail'),
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
                        onChanged: (newValue) {
                          context
                              .read<LoginBloc>()
                              .add(PasswordChanged(newValue));
                        },
                      ),
                    ],
                  );

                case PageStatus.error:
                  return const Center(
                    child: Text('Error'),
                  );

              }
            }),
            BlocConsumer<LoginBloc, LoginPageState>(
              listener: (context, state){
                if(state.status == PageStatus.success){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlanPage()));
                }
              },
                buildWhen: (p,c){
                  return p.status != c.status;
                },
                builder: (context, state) {
              switch (state.status) {
                case PageStatus.initial:
                case PageStatus.error:
                  return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(OnTapLogin());
                      },
                      child: const Text('login'));

                case PageStatus.loading:
                  return CircularProgressIndicator();

                case PageStatus.success:
                  return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
