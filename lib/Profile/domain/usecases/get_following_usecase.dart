import 'package:brilliant_app/Profile/domain/entities/profile.dart';
import 'package:brilliant_app/Profile/domain/repositories/profile_repository.dart';

class GetFollowingUseCase{
  final ProfileRepository profileRepository;

  GetFollowingUseCase(this.profileRepository);

  Future<void> excute(List following) async{
    return await profileRepository.getFollowing(following);
  }
}