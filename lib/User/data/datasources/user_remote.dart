import 'package:brilliant_app/User/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
final _db = FirebaseFirestore.instance;

abstract class UserRemoteDataSource {
  Future<void> createUser(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth _auth;
  UserRemoteDataSourceImpl(this._auth);

  @override
  Future<void> createUser(UserModel user) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: user.username, password: user.password);
      await _db.collection("Users").add(user.toJson());
    } on FirebaseAuthException catch (e) {
      print(e.message!);
    }
  }


}
