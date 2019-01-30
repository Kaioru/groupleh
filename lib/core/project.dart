class Project {
  final String id;
  String name;
  String desc;
  String desc2;
  final String image;
  final List<String> tags;
  final List<String> applicants;

  final String leader;
  final List<String> members;

  Project(
      {this.id,
      this.name,
      this.desc,
      this.desc2,
      this.image,
      this.tags,
      this.applicants,
      this.leader,
      this.members});
}
