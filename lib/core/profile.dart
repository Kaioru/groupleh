class Profile {
  final String id;

  final String name;
  final String desc;
  final int coins;
  final int achievementCount;
  final int wardrobeCount;
  final int projectCount;
  final String image;

  final String wardrobeHair;
  final String wardrobeTop;
  final String wardrobeBottom;

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
