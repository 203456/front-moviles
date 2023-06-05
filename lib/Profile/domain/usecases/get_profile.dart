import 'package:brilliant_app/Profile/domain/entities/profile.dart';
import 'package:brilliant_app/Profile/domain/repositories/Profile_repository.dart';

class GetProfileUseCase{
  final ProfileRepository profileRepository;

  GetProfileUseCase(this.profileRepository);

  Future<Profile> excute(int id) async{
    return await profileRepository.getProfile(id);
  }
}