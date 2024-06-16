class ZumbaInstructionModel {
  String info;
  List<String> notes;

  ZumbaInstructionModel({
    required this.info,
    required this.notes,
  });

  factory ZumbaInstructionModel.fromSnapshot(dynamic json) =>
      ZumbaInstructionModel(
        info: json["info"],
        notes: List<String>.from(json["notes"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "info": info,
        "notes": List<dynamic>.from(notes.map((x) => x)),
      };
}

class ZumbaRoutineModel {
  String description;
  String name;
  String image;
  String duration;
  String cals;

  ZumbaRoutineModel(
      {required this.description,
      required this.name,
      required this.image,
      required this.cals,
      required this.duration});

  factory ZumbaRoutineModel.fromSnapshot(dynamic json) => ZumbaRoutineModel(
        description: json["description"],
        name: json["name"],
        image: json["image"],
        duration: json["duration"],
        cals: json["cals"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "name": name,
        "image": image,
        "cals": cals,
        "duration": duration
      };
}
