import 'package:frankenstein_app/presentation/bloc/login/login_event.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginChangeEvent) {
      yield* _login(event);
    }
  }

  Stream<LoginState> _login(LoginChangeEvent event) async* {
    if (event is LoginChangeEvent) {
      await Future<void>.delayed(const Duration(seconds: 2));
      yield LoginSuccessState();
    }
  }
}
