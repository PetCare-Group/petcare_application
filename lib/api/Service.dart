import 'dart:convert';
import 'listaServiceUsers.dart';
import 'package:http/http.dart' as http;
import 'UserService.dart';

class Service{
  static Future<List<UserService>> getUserServices() async{
    final rspta=await http.get(Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/services'));

    if(rspta.statusCode==200){
      final rsptaJson=json.decode(rspta.body);
      final todosUserServices=ListaServiceUsers.listado(rsptaJson);
      return todosUserServices;
    }
    else{
      return <UserService>[];
    }
  }
}