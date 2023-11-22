// En petdetails.dart

import 'package:flutter/material.dart';
import 'package:petcare_application/api/Pet.dart';
import 'package:petcare_application/api/PetService.dart';

class PetDetails extends StatelessWidget {
  final Pet pet;
  final String imageUrl;

  PetDetails({required this.pet, required this.imageUrl});

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar Mascota'),
          content: Text('¿Estás seguro de que deseas eliminar a ${pet.name} de la lista de mascotas?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sí'),
              onPressed: () async {
                await PetService().deletePet(pet.id);
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
                elevation: 5.0,
                child:

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text('MI MASCOTA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(pet.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Descripción: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                              Flexible(child: Text(pet.description, style: TextStyle(fontSize: 20)),)

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Edad:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                              Text('${pet.edad} años', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),



            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _confirmDelete(context),
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
    );
  }
}
