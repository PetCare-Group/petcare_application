import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/frequentquestions.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/pref/preference.dart';

class configuration extends StatefulWidget {
  const configuration({super.key});

  @override
  State<configuration> createState() => _configurationState();
}

class _configurationState extends State<configuration> {

  preference pref=preference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),
        title: Text("Configuración", style: TextStyle(
          color: Color.fromRGBO(44, 52, 62, 1),
          fontWeight: FontWeight.bold,
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_return_sharp),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => home()),
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(248, 209, 55, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                child: DrawerHeader(
                  child: Image(image: AssetImage("assets/images/logo-menu.png"),),
                ),
              ),

              ListTile(
                title: Text('Inicio', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return home();
                      }));
                },
              ),
              ListTile(
                title: Text('Añadir Mascota', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return addpet();
                      }));
                },
              ),
              ListTile(
                title: Text('Configuración', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {

                },
              ),
              ListTile(
                title: Text('Ayuda', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return FrequentQuestions();
                      }));
                },
              ),
            ],
          ),
        ),),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.food_bank_outlined,size: 40),
                ),

                Expanded(child: Text('Recordatorio de alimentación: ',style: TextStyle(
                  fontSize: 18
                )),),

                Switch(value: pref.food, onChanged: (value){
                  setState(() {
                  pref.food=value;
                  pref.guardarFood();
                  });
              }),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.directions_walk,size: 40),
                ),

                Expanded(child: Text('Recordatorio de paseo: ',style: TextStyle(
                    fontSize: 18
                )),),

                Switch(value: pref.walk, onChanged: (value){
                  setState(() {
                  pref.walk=value;
                  pref.guardarWalk();
                  });
                }),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_active,size: 40),
                ),

                Expanded(child: Text('Activar Notificaciones: ',style: TextStyle(
                    fontSize: 18
                )),),

                Switch(value: pref.notification, onChanged: (value){
                  setState(() {
                  pref.notification=value;
                  pref.guardarNotification();
                  });
                }),
              ],
            ),
          ),

        ],
      ),

    );
  }

  @override
  void initState() {
    pref.init().then((value){
      setState(() {
        pref=value;
      });
    });
  }

}
