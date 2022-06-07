class StudentModel {
  StudentModel({
    required this.id,
    required this.name,
    required this.mainTech,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as int,
      name: json['name'] as String,
      mainTech: json['mainTech'] as String,
    );
  }

  final int id;
  final String name;
  final String mainTech;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'mainTech': mainTech,
    };
  }

  @override
  String toString() => 'StudentModel(id: $id, name: $name, mainTech: $mainTech)';
}
