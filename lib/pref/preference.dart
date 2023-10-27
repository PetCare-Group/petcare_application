import 'package:shared_preferences/shared_preferences.dart';
class preference{

  SharedPreferences? preferencia;
  bool food=false;
  bool walk=false;
  bool notification=false;
  String user="";

  Future<SharedPreferences?> get preferences async{
    if (preferencia==null){
      preferencia=await SharedPreferences.getInstance();
      food=preferencia?.getBool("food")??false;
      walk=preferencia?.getBool("walk")??false;
      notification=preferencia?.getBool("notification")??false;
      user=preferencia?.getString("user")??"";

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


}