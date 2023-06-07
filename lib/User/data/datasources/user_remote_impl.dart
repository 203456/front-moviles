import 'package:brilliant_app/User/data/datasources/user_remote.dart';
import 'package:brilliant_app/User/data/models/user_model.dart';
import 'package:brilliant_app/User/domain/entities/user.dart';
import 'package:brilliant_app/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  FirebaseRemoteDataSourceImpl(
      {required this.firebaseStorage,
      required this.firebaseFirestore,
      required this.firebaseAuth});

  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Future<void> createUser(UserEntity user) async {
    final collection = firebaseFirestore.collection(FirebaseConst.users);

    final uid = await getCurrentUid();

    collection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              id: user.id,
              name: user.name,
              password: user.password,
              email: user.email,
              bio: user.bio,
              username: user.username,
              birth: user.birth,
              gamertag: user.gamertag,
              location: user.location)
          .toJson();

      if (!userDoc.exists) {
        collection.doc(uid).set(newUser);
      } else {
        collection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      toast("Some error occur");
    });
  }
}
