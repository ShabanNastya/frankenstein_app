import 'package:equatable/equatable.dart';
import 'package:frankenstein_app/presentation/bloc/login/login_state.dart';

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
