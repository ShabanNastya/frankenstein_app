import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frankenstein_app/domain/validator/validator_mixin.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_event.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginPageState> with ValidatorMixin {
  LoginBloc() : super(LoginPageState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.value));
      print(state);
    });
  }
}
