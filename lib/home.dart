

import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/api/Service.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/login.dart';
import 'package:petcare_application/perfil.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final txtDistrito=TextEditingController();
  final txtServicio=TextEditingController();
  final txtPrecio=TextEditingController();
  String filterText="";

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
        title: Text("PetCare", style: TextStyle(
          color: Color.fromRGBO(44, 52, 62, 1),
          fontWeight: FontWeight.bold,
        )),
    actions: <Widget>[
          PopupMenuButton<String>(
            color: Color.fromRGBO(103, 80, 164, 1),
            elevation: 10,
            onSelected: (String result) {
              if (result == 'Cerrar sesión'){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              }
              if (result == 'Ver perfil'){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => perfil()),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Ver perfil',
                child: Text('Ver perfil', style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                )),
              ),
              const PopupMenuItem<String>(
                value: 'Cerrar sesión',
                child: Text('Cerrar sesión', style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      )),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage('https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/05/Goku-nino-hace-cosplay-de-Arale-Naruto-y-Seiya-en-estas-tiernas-imagenes-compartidas-en-Twitter.jpg'),
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
                title: Text('Ayuda', style: TextStyle(color: Color.fromRGBO(44, 52, 62, 1))),
                onTap: () {
                  // Aquí puedes manejar la acción cuando se presiona 'Ayuda'
                },
              ),
            ],
          ),
        ),),

      body: FutureBuilder(
        initialData: [],
        future: Service.getUserServices(),
        builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
        } else {
        return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("Filtros", style: TextStyle(
                  color: Color.fromRGBO(44, 52, 62, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),

                SizedBox(height: 5),

                GestureDetector(
                  onTap: _showFilterSheet,
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),

                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(filterText),
                          Container(child: Icon(Icons.search)),
                        ],)
                  ),
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
          Expanded(
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
                                            image: NetworkImage('https://source.unsplash.com/random/?veterinarian/${index+14}'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),




                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
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

        ],
        );
        }
    } else {
      return Text("Estado desconocido");
    }
        },
    )

    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: txtDistrito,
                decoration: InputDecoration(
                  labelText: 'Distrito',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: txtServicio,
                decoration: InputDecoration(
                  labelText: 'Tipo de Servicio',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: txtPrecio,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Precio',
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filterText = "${txtDistrito.text} / ${txtServicio.text} / ${txtPrecio.text}";
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(44, 52, 62, 1),
                ),
                child: Text('Buscar', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

}

