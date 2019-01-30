class Profile {
  final String id;

  String name;
  String desc;
  int coins;
  final int achievementCount;
  final int wardrobeCount;
  final int projectCount;
  String image;

  String wardrobeHair;
  String wardrobeTop;
  String wardrobeBottom;

  Profile(
      {this.id,
      this.name,
      this.desc,
      this.coins,
      this.achievementCount,
      this.wardrobeCount,
      this.projectCount,
      this.image,
      this.wardrobeHair,
      this.wardrobeTop,
      this.wardrobeBottom});
}
