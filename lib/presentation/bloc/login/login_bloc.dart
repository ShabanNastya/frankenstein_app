import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frankenstein_app/domain/validator/validator_mixin.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_event.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginPageState> with ValidatorMixin {
  LoginBloc() : super(const LoginPageState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.value));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.value));
    });

    on<OnTapLogin>((event, emit) async{
      emit(state.copyWith(status: PageStatus.loading));
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(status: PageStatus.success));
      /*if (validateEmail(event.value)) {
        emit(state.copyWith(email: event.value));
        print(state);
      } else {
        emit(state.copyWith(status: PageStatus.error));
      }*/
    });
  }
}
