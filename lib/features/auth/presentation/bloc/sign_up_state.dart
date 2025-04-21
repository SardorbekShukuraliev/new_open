part of 'sign_up_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  final UserEntity user;

  const SignupSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class SignupFailure extends SignupState {
  final String errorMessage;

  const SignupFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
