import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class preference{
  static final preference _instance = preference._internal();
  factory preference() => _instance;


  SharedPreferences? preferencia;
  bool food=false;
  bool walk=false;
  bool notification=false;
  String user="";

  String nombre = "";
  String apellido = "";
  String celular = "";
  String direccion = "";

  preference._internal() {
    _init();
  }

  void _init() async {
    preferencia = await SharedPreferences.getInstance();
  }

  Future<SharedPreferences?> get preferences async{
    if (preferencia==null){
      preferencia=await SharedPreferences.getInstance();
      food=preferencia?.getBool("food")??false;
      walk=preferencia?.getBool("walk")??false;
      notification=preferencia?.getBool("notification")??false;
      user=preferencia?.getString("user")??"";
      nombre = preferencia?.getString("nombre") ?? nombre;
      apellido = preferencia?.getString("apellido") ?? apellido;
      celular = preferencia?.getString("celular") ?? celular;
      direccion = preferencia?.getString("direccion") ?? direccion;

    }
    return preferencia;
  }

  Future<preference> init() async{
    preferencia=await preferences;


    return this;
  }

  Future<void> guardarFood() async{
    await preferencia?.setBool("food", food);
  }

  Future<void> guardarWalk() async{
    await preferencia?.setBool("walk", walk);
  }

  Future<void> guardarNotification() async{
    await preferencia?.setBool("notification", notification);
  }

  Future<void> guardarUser() async{
    await preferencia?.setString("user", user);
  }

  void guardarNombres(String nombre) async {
    await preferencia?.setString("nombre", nombre);
  }

  void guardarApellidos(String apellido) async {
    await preferencia?.setString("apellido", apellido);
  }

  void guardarCelulars(String celular) async {
    await preferencia?.setString("celular", celular);
  }

  void guardarDireccions(String direccion) async {
    await preferencia?.setString("direccion", direccion);
  }

  Future<void> limpiarNombre() async {
    await preferencia?.setString("nombre", "");
  }

  Future<void> limpiarApellido() async {
    await preferencia?.setString("apellido", "");
  }

  Future<void> limpiarCelular() async {
    await preferencia?.setString("celular", "");
  }

  Future<void> limpiarDireccion() async {
    await preferencia?.setString("direccion", "");
  }

  Future<void> limpiarFood() async{
    await preferencia?.setBool("food", false);
  }

  Future<void> limpiarWalk() async{
    await preferencia?.setBool("walk", false);
  }

  Future<void> limpiarNotification() async{
    await preferencia?.setBool("notification", false);
  }


  Future<void> limpiarPreferenciasPerfil() async {
    await limpiarNombre();
    await limpiarApellido();
    await limpiarCelular();
    await limpiarDireccion();
    await limpiarFood();
    await limpiarWalk();
    await limpiarNotification();
  }
//EXTRA
  Future<void> saveAppointmentDetails(Map<String, dynamic> appointmentDetails) async {
    final prefs = await preferences;
    List<Map<String, dynamic>> allAppointments = await getAppointmentDetails() ?? [];
    allAppointments.add(appointmentDetails);
    await prefs?.setString('appointments', json.encode(allAppointments));
  }

  Future<List<Map<String, dynamic>>?> getAppointmentDetails() async {
    final prefs = await preferences;
    final String? appointmentsJson = prefs?.getString('appointments');
    if (appointmentsJson != null) {
      final List<dynamic> jsonDecoded = json.decode(appointmentsJson);
      return jsonDecoded.cast<Map<String, dynamic>>();
    }
    return null;
  }

  Future<void> removeAppointmentDetailsAtIndex(int index) async {
    final prefs = await preferences;
    List<Map<String, dynamic>> allAppointments = await getAppointmentDetails() ?? [];
    if(index >= 0 && index < allAppointments.length) {
      allAppointments.removeAt(index);
      await prefs?.setString('appointments', json.encode(allAppointments));
    }
  }


}