import 'dart:io';

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

  UserRemoteDataSourceImpl(
      {required this.firebaseStorage,
      required this.firebaseFirestore,
      required this.firebaseAuth});

  @override
  Future<String> getCurrentid() async => firebaseAuth.currentUser!.uid;

  @override
  Future<void> createUser(UserEntity user) async {
    print("Entró");
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);

    final uid = await getCurrentid();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
          uid: uid,
          name: user.name,
          email: user.email,
          bio: user.bio,
      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      toast("Some error occur");
    });
  }


  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users).where("uid", isEqualTo: uid).limit(1);
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signInUser(UserEntity user)async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(email: user.email!, password: user.password!);
      } else {
        print("fields cannot be empty");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        toast("user not found");
      } else if (e.code == "wrong-password") {
        toast("Invalid email or password");
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUpUser(UserEntity user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: user.email!, password: user.password!).then((currentUser) async{
        if (currentUser.user?.uid != null) {
          await createUser((user));
        }
      });
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toast("email is already taken");
      } else {
        toast("something went wrong");
      }
    }
  }
  
 

}
