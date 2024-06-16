class FullBodyStretchingModel {
  String duration;
  String cals;
  String instructions;
  String name;
  String image;

  FullBodyStretchingModel({
    required this.duration,
    required this.cals,
    required this.instructions,
    required this.name,
    required this.image,
  });

  factory FullBodyStretchingModel.fromSnapshot(dynamic json) => FullBodyStretchingModel(
    duration: json["duration"],
    cals: json["cals"],
    instructions: json["instructions"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "duration": duration,
    "cals": cals,
    "instructions": instructions,
    "name": name,
    "image": image,
  };
}