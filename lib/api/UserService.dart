import 'package:petcare_application/api/User.dart';

class UserService{

  int serviceId;
  int price;
  String description;
  String location;
  String phone;
  String dni;
  bool cuidador;
  User user;


  UserService({required this.serviceId, required this.price, required this.description, required this.location,
    required this.phone, required this.dni, required this.cuidador, required this.user});


  static UserService objJson(Map<String, dynamic> json){
    return UserService(
        serviceId: json['serviceId'] as int,
        price: json['price'] as int,
        description: json['description'] as String,
        location: json['location'] as String,
        phone: json['phone'].toString(),
        dni: json['dni'].toString(),
        cuidador: json['cuidador'] as bool,
        user: User.objJson(json['user'])
    );
  }


}