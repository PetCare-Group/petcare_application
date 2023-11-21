class Pet {
  int id;
  String name;
  String description;
  int castrado;
  int edad;
  int userId;

  Pet({
    required this.id,
    required this.name,
    required this.description,
    required this.castrado,
    required this.edad,
    required this.userId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      castrado: json['castrado'] as int,
      edad: json['edad'] as int,
      userId: json['userId'] as int,
    );
  }
}
