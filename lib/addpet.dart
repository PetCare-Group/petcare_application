import 'package:flutter/material.dart';
import 'package:petcare_application/api/Pet.dart';
import 'package:petcare_application/api/PetService.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/formpet.dart';
import 'package:petcare_application/frequentquestions.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/petdetails.dart';

class addpet extends StatefulWidget {
  const addpet({super.key});

  @override
  State<addpet> createState() => _addpetState();
}

class _addpetState extends State<addpet> {
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
        title: Text("Añadir Mascota", style: TextStyle(
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


      body: FutureBuilder<List<Pet>>(
        future: PetService().fetchPets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final pets = snapshot.data!;
            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetDetails(pet: pet)),
                    ).then((_) {
                      setState(() {
                      });
                    });
                  },
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('https://source.unsplash.com/random/?pets/${index+14}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pet.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text(pet.description, style: TextStyle(fontSize: 18)),
                                    Text('${pet.edad} años', style: TextStyle(fontSize: 18)),
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
            );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Estado desconocido');
            }
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPet()),
          );
        },
        elevation: 10,
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
        child: Icon(Icons.add, color: Color.fromRGBO(44, 52, 62, 1)),
      ),



    );
  }
}
