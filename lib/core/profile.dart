import 'package:groupleh/core/group.dart';
import 'package:groupleh/core/achievement.dart';

class Profile {
  final String id;

  final String name;
  final String desc;
  final int coins;
  final String image;

  final List<Group> groups;
  final List<Achievement> achievements;

  Profile(
      {this.id,
      this.name,
      this.desc,
      this.coins,
      this.image,
      this.groups,
      this.achievements});
}
