import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? image;

  AuthEntity(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.image});

  @override
  List<Object?> get props =>
      [id, firstName, lastName, email, password, image];
}
