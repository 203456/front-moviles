import 'package:brilliant_app/Profile/domain/entities/profile.dart';
abstract class ProfileRepository{
  Future<Profile>getProfile(int id);
  Future<Profile> getFollowers(List followers);
  Future<Profile> getFollowing(List following);
  Future<void>updateProfile(Profile profile);


}