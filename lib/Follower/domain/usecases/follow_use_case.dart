import 'package:brilliant_app/Follower/domain/entities/follower.dart';
import 'package:brilliant_app/Follower/domain/repositories/follower_repository.dart';

class FollowUseCase{
  final FollowersRepository followersRepository;

  FollowUseCase(this.followersRepository);

  Future<Followers> excute(int id) async{
    return await followersRepository.follow(id);
  }
}
