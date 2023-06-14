
import 'dart:io';

import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';

import '../datasources/user_remote.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<void> createUser(UserEntity user) async => userRemoteDataSource.createUser(user);

  @override
  Future<String> getCurrentid() async => userRemoteDataSource.getCurrentid();

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) => userRemoteDataSource.getSingleUser(uid);

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user)  => userRemoteDataSource.getUsers(user);


  @override
  Future<void> signInUser(UserEntity user) => userRemoteDataSource.signInUser(user);


  @override
  Future<void> signOut() async => userRemoteDataSource.signOut();

  @override
  Future<void> signUpUser(UserEntity user) async => userRemoteDataSource.signUpUser(user);
  
  @override
  Future<bool> isSignIn() async => userRemoteDataSource.isSignIn();


}