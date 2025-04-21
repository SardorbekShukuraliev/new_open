part of 'sign_up_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final String firstName;
  final String lastName;
  final String emailOrPhone;
  final String password;
  final bool useEmail;

  const SignupSubmitted({
    required this.firstName,
    required this.lastName,
    required this.emailOrPhone,
    required this.password,
    this.useEmail = false,
  });

  @override
  List<Object> get props =>
      [firstName, lastName, emailOrPhone, password, useEmail];
}