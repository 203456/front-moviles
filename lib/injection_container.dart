import 'package:brilliant_app/Post/data/datasources/post_remote_datasource_impl.dart';
import 'package:brilliant_app/Post/data/repository/post_repository_impl.dart';
import 'package:brilliant_app/Post/domain/repository/post_repository.dart';
import 'package:brilliant_app/Post/domain/usecases/create_post_usecase.dart';
import 'package:brilliant_app/Post/domain/usecases/delete_post_usecase.dart';
import 'package:brilliant_app/Post/domain/usecases/like_post_usecase.dart';
import 'package:brilliant_app/Post/domain/usecases/read_post_usecase.dart';
import 'package:brilliant_app/Post/domain/usecases/read_single_post_usecase.dart';
import 'package:brilliant_app/Post/domain/usecases/update_post_usecase.dart';
import 'package:brilliant_app/Post/presentation/cubit/post_cubit.dart';
import 'package:brilliant_app/User/data/datasources/user_remote.dart';
import 'package:brilliant_app/User/data/datasources/user_remote_impl.dart';
import 'package:brilliant_app/User/data/repositories/user_repositories_impl.dart';
import 'package:brilliant_app/User/domain/repositories/user_repository.dart';
import 'package:brilliant_app/User/domain/usecases/create_user_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/current_id_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/get_single_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/get_users_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/is_sign_in_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/sign_in_usecases.dart';
import 'package:brilliant_app/User/domain/usecases/sign_out_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/sign_up_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/update_user_usecase.dart';
import 'package:brilliant_app/User/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:brilliant_app/User/presentation/cubit/Auth/auth_cubit.dart';
import 'package:brilliant_app/User/presentation/cubit/User/user_cubit.dart';
import 'package:brilliant_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import 'Post/data/datasources/post_remote_datasource.dart';
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


  sl.registerFactory(
        () => UserCubit(
      updateUserUseCase: sl.call(),
      getUsersUseCase: sl.call(),
    ),
  );

  // Post Cubit Injection
  sl.registerFactory(
        () => PostCubit(
        createPostUseCase: sl.call(),
        deletePostUseCase: sl.call(),
        likePostUseCase: sl.call(),
        readPostUseCase: sl.call(),
        updatePostUseCase: sl.call()
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
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetUsersUseCase(repository: sl.call()));



  //Cloud Storage
  sl.registerLazySingleton(() => UploadImageToStorageUseCase(repository: sl.call()));


  // Post
  sl.registerLazySingleton(() => CreatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadPostsUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => LikePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => DeletePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadSinglePostUseCase(repository: sl.call()));


  //Repository

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl.call()));
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(remoteDataSource: sl.call()));

  // Remote Data Source
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseAuth: sl.call(), firebaseStorage: sl.call()));
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseAuth: sl.call(), firebaseStorage: sl.call()));

  // Externals

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}