import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;

  const User(this.id, this.username);

  @override
  List<Object?> get props => [id];
}
