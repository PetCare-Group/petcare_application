import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/frequentquestions.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/pref/preference.dart';
import 'package:petcare_application/termsandconditions.dart';

class MyServicesScreen extends StatefulWidget {
  @override
  _MyServicesScreenState createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  List<Map<String, dynamic>> appointments = [];

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    final data = await preference().getAppointmentDetails();
    if (data != null) {
      setState(() {
        appointments = List<Map<String, dynamic>>.from(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text("Mis Servicios", style: TextStyle(
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
                  child: Image(
                    image: AssetImage("assets/images/logo-menu.png"),),
                ),
              ),

              ListTile(
                title: Text('Inicio',
                    style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return home();
                      }));
                },
              ),
              ListTile(
                title: Text('Añadir Mascota',
                    style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => addpet()),
                  );
                },
              ),
              ListTile(
                title: Text('Configuración',
                    style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return configuration();
                      }));
                },
              ),
              ListTile(
                title: Text('Mis Servicios',
                    style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {},
              ),
              ListTile(
                title: Text('Ayuda',
                    style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return FrequentQuestions();
                      }));
                },
              ),
              ListTile(
                title: Text('Términos y Condiciones', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return TermsAndConditionsScreen();
                      }));
                },
              ),
            ],
          ),
        ),),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Dismissible(
            key: Key(appointment['date']),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.delete_forever, color: Colors.white),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                appointments.removeAt(index);
              });
            },
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Cancelar Servicio'),
                    content: Text(
                        '¿Estás seguro de que deseas cancelar este servicio?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop(
                              false);
                        },
                      ),
                      TextButton(
                        child: Text('Sí'),
                        onPressed: () async {
                          await preference().removeAppointmentDetailsAtIndex(index);
                          Navigator.of(context).pop(true);
                          setState(() {
                            appointments.removeAt(index);
                          });
                        },
                      ),

                    ],
                  );
                },
              );
            },
            child: Card(
              child: ListTile(
                title: Text(
                    '${appointment['firstName']} ${appointment['lastName']}'),
                subtitle: Text(
                    'Fecha: ${appointment['date']} - Hora: ${appointment['startTime']}'),
                trailing: Text('${appointment['paymentMethod']}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
