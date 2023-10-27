import 'package:flutter/material.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/home.dart';

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
                  // Aquí puedes manejar la acción cuando se presiona 'Ayuda'
                },
              ),
            ],
          ),
        ),),

        /*body: FutureBuilder(
          initialData: [],
          future: Service.getUserServices(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column();
              }
            } else {
              return Text("Estado desconocido");
            }
          },
        )*/

      //lo de abajo colocarlo dps del return del futurebuilder

      /*
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              if (snapshot.data != null) {
                var userservice = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Container(
                                  width: 120,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage('https://www.zooplus.es/magazine/wp-content/uploads/2020/10/Adiestrador-de-perros.jpeg'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),




                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${userservice.user.firstName.toString()} ${userservice.user.lastName.toString()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Icon(Icons.phone, color: Color.fromRGBO(103, 80, 164, 1)),
                                            Text(': ${userservice.phone.toString()}', style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.monetization_on, color: Color.fromRGBO(103, 80, 164, 1)),
                                            Text(': S/. ${userservice.price.toString()}', style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      */

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.0,
              child: Container(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('https://www.zooplus.es/magazine/wp-content/uploads/2020/10/Adiestrador-de-perros.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),




                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('NOMBRE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      Text('RAZA', style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('EDAD', style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(onPressed: () {

          },elevation: 10,backgroundColor: Color.fromRGBO(248, 209, 55, 1),child: Icon(Icons.add,color: Color.fromRGBO(44, 52, 62, 1),),),
        ],
      ),





    );
  }
}
