
class User{
  int id;
  String firstName;
  String lastName;
  String phone;
  String dni;
  String mail;

  User({required this.id, required this.firstName, required this.lastName, required this.phone, required this.dni, required this.mail});

  static User objJson(Map<String, dynamic> json){
    return User(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phone: json['phone'].toString(),
        dni: json['dni'].toString(),
        mail: json['mail'] as String);
  }

}