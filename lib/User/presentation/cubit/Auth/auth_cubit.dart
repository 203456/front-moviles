import 'package:bloc/bloc.dart';
import 'package:brilliant_app/User/domain/usecases/current_id_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/is_sign_in_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/sign_out_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentIdUseCase getCurrentIdUseCase;
  AuthCubit({required this.signOutUseCase, required this.isSignInUseCase, required this.getCurrentIdUseCase}) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUseCase.call();
      if (isSignIn == true) {

        final uid = await getCurrentIdUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch(_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentIdUseCase.call();
      emit(Authenticated(uid: uid));
    } catch(_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut()async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}