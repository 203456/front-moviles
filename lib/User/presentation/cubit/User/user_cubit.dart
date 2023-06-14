import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/usecases/get_users_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  final GetUsersUseCase getUsersUseCase;
  UserCubit({ required this.getUsersUseCase}) : super(UserInitial());

  Future<void> getUsers({required UserEntity user}) async {
    emit(UserLoading());
    try {
      final streamResponse = getUsersUseCase.call(user);
      streamResponse.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch(_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }


}