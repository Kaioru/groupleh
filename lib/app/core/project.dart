class Project {
  String image;
  String name;
  String description;
  CompletionRate completionRate;
  Project(this.image, this.name, this.description, this.completionRate);
}

enum CompletionRate{
  notstarted,
  ongoing,
  ditched,
  completed,
}