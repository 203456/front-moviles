import 'package:brilliant_app/Profile/domain/entities/profile.dart';

import 'package:brilliant_app/Profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase{
  final ProfileRepository profileRepository;

  UpdateProfileUseCase(this.profileRepository);

  Future<void> excute(Profile profile) async{
    return await profileRepository.updateProfile(profile);
  }
}