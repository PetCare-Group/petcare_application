import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/api/Service.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/frequentquestions.dart';
import 'package:petcare_application/login.dart';
import 'package:petcare_application/myservices.dart';
import 'package:petcare_application/perfil.dart';
import 'package:petcare_application/servicedetails.dart';
import 'package:petcare_application/api/UserService.dart';
import 'package:petcare_application/termsandconditions.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final txtDistrito = TextEditingController();
  List<UserService> services = [];
  List<UserService> filteredServices = [];

  @override
  void initState() {
    super.initState();
    Service.getUserServices().then((fetchedServices) {
      setState(() {
        services = fetchedServices;
        filteredServices = fetchedServices;
      });
    });
  }

  void filterServices(String enteredText) {
    List<UserService> results = [];
    if (enteredText.isEmpty) {
      results = services;
    } else {
      results = services
          .where((service) =>
          service.location.toLowerCase().contains(enteredText.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredServices = results;
    });
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
        title: Text(
          "PetCare",
          style: TextStyle(
            color: Color.fromRGBO(44, 52, 62, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Color.fromRGBO(103, 80, 164, 1),
            elevation: 10,
            onSelected: (String result) {
              if (result == 'Cerrar sesión') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              }
              if (result == 'Ver perfil') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => perfil()),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Ver perfil',
                child: Text('Ver perfil',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const PopupMenuItem<String>(
                value: 'Cerrar sesión',
                child: Text('Cerrar sesión',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(
                    'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/05/Goku-nino-hace-cosplay-de-Arale-Naruto-y-Seiya-en-estas-tiernas-imagenes-compartidas-en-Twitter.jpg'),
              ),
            ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return configuration();
                      }));
                },
              ),
              ListTile(
                title: Text('Mis Servicios', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return MyServicesScreen();
                      }));
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
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: txtDistrito,
              decoration: InputDecoration(
                labelText: 'Buscar por distrito',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: filterServices,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                var userService = filteredServices[index];
                return InkWell(
                  onTap: () {
                    String imageUrl = 'https://source.unsplash.com/random/?veterinarian/${index + 14}';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetails(
                          userService: userService,
                          imageUrl: imageUrl,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('https://source.unsplash.com/random/?veterinarian/${index + 14}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${userService.user.firstName} ${userService.user.lastName}',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis, // Añade esto para prevenir desbordamiento
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone, color: Color.fromRGBO(103, 80, 164, 1)),
                                        Text(': ${userService.phone}', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined, color: Color.fromRGBO(103, 80, 164, 1)),
                                        Flexible( // Añade el widget Flexible aquí
                                          child: Text(
                                            ': ${userService.location}',
                                            style: TextStyle(fontSize: 18),
                                            overflow: TextOverflow.ellipsis, // Añade esto para prevenir desbordamiento
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.monetization_on, color: Color.fromRGBO(103, 80, 164, 1)),
                                        Text(': S/. ${userService.price}', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
