import 'package:equatable/equatable.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_state.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginChangeEvent extends LoginEvent {
  final LoginState loginState;

  LoginChangeEvent(this.loginState);

  @override
  List<Object?> get props => [loginState];
}
