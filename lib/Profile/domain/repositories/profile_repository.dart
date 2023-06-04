import 'package:brilliant_app/Profile/domain/entities/profile.dart';
abstract class ProfileRepository{
  Future<Profile>getProfile(int id);
  Future<void> getFollowers(List followers);
  Future<void> getFollowing(List following);
  Future<void>updateProfile(Profile profile);


}