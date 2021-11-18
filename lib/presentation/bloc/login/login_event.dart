import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent {
  final String value;

  EmailChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class PasswordChanged extends LoginEvent {
  final String value;

  PasswordChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class OnTapLogin extends LoginEvent {

}