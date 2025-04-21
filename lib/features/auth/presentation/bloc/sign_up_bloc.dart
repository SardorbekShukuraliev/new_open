import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;

  SignupBloc({required this.authRepository}) : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    try {

      final ApiResponse response;
      if (event.useEmail) {
        response = await authRepository.registerWithEmail(
          event.emailOrPhone,
          event.password,
          event.firstName,
          event.lastName,
        );

      } else {
        response = await authRepository.registerWithPhone(
          event.emailOrPhone,
          event.password,
          event.firstName,
          event.lastName,
        );
      }

      if (response.success && response.data != null) {
        emit(SignupSuccess(user: response.data!));
      } else {
        emit(SignupFailure(
            errorMessage: response.error?.message ?? 'Registration failed'));
      }
    } catch (e) {
      emit(SignupFailure(errorMessage: e.toString()));
    }
  }
}
