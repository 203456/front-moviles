import 'package:brilliant_app/Profile/domain/entities/profile.dart';
import 'package:brilliant_app/Profile/domain/repositories/profile_repository.dart';

class GetFollowersUseCase{
  final ProfileRepository profileRepository;

  GetFollowersUseCase(this.profileRepository);

  Future<Profile> excute( List followers) async{
    return await profileRepository.getFollowers(followers);
  }
}