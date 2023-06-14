import 'package:brilliant_app/Follower/domain/entities/follower.dart';
import 'package:brilliant_app/Follower/domain/repositories/follower_repository.dart';

class UnFollowUseCase{
  final FollowersRepository followersRepository;

  UnFollowUseCase(this.followersRepository);

  Future<Followers> excute(int id) async{
    return await followersRepository.unfollow(id);
  }
}
