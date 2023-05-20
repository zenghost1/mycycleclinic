import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });

    on<ResetPassword>((event, emit) async {
      emit(PasswordResetLoading());
      try{await authRepository.resetPassword(email: event.email);
      emit(PasswordResetSuccess());}
      catch(e){
        emit(PasswordResetFailure(e.toString()));
      }
    });
  }
}

// class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
//   PasswordResetBloc() : super(PasswordResetInitial());

//   @override
//   Stream<PasswordResetState> mapEventToState(PasswordResetEvent event) async* {
//     if (event is ResetPassword) {
//       yield PasswordResetLoading();
//       try {
//         yield PasswordResetSuccess();
//       } catch (e) {
//         yield PasswordResetFailure(e.toString());
//       }
//     }
//   }

