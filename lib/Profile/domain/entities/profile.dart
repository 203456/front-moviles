class Profile {
  final int id;
  final String username;
  final String name;
  final String birth;
  final String location;
  final String bio;
  final List<ListFollowers> followers;
  final List<ListFollowing> following;


  Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.location,
    required this.birth,
    required this.bio,
    required this.followers,
    required this.following
  });
  
}
class ListFollowers{
 final String username;


 ListFollowers({
  required this.username
 });
}

class ListFollowing{
 final String username;


 ListFollowing({
  required this.username
 });
}