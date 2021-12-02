import 'package:equatable/equatable.dart';

enum PageStatus {
  initial,
  loading,
  success,
  error,
}

class LoginPageState extends Equatable {
  final String email;
  final String password;
  final PageStatus status;

  const LoginPageState(
      {this.email = '', this.password = '', this.status = PageStatus.initial});

  LoginPageState copyWith({
    String? email,
    String? password,
    PageStatus? status,
  }) {
    return LoginPageState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
