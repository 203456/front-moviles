import 'package:brilliant_app/User/data/datasources/user_remote.dart';
import 'package:brilliant_app/User/data/datasources/user_remote_impl.dart';
import 'package:brilliant_app/User/data/repositories/user_repositories_impl.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';
import 'package:brilliant_app/User/domain/usecases/create_user_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/current_id_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/get_single_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/is_sign_in_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/sign_in_usecases.dart';
import 'package:brilliant_app/User/domain/usecases/sign_out_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/sign_up_usecase.dart';
import 'package:brilliant_app/User/presentation/cubit/Auth/auth_cubit.dart';
import 'package:brilliant_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import 'User/presentation/cubit/Credential/credential_cubit.dart';
import 'User/presentation/cubit/User/get_single_user/get_single_user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(
    () => AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentIdUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
        () => CredentialCubit(
          signUpUseCase: sl.call(),
          signInUserUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
        () => GetSingleUserCubit(
      getSingleUserUseCase: sl.call()
    ),
  );




  // Use Cases
  // User
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentIdUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUseCase(repository: sl.call()));
 

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl.call()));

  // Remote Data Source
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseAuth: sl.call(), firebaseStorage: sl.call()));

  // Externals

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}