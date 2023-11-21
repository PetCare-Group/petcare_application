import 'package:flutter/material.dart';
import 'package:petcare_application/api/Pet.dart';
import 'package:petcare_application/api/PetService.dart';

class PetDetails extends StatelessWidget {
  final Pet pet;

  PetDetails({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre: ${pet.name}', style: TextStyle(fontSize: 20)),
            Text('Descripción: ${pet.description}', style: TextStyle(fontSize: 20)),
            Text('Edad: ${pet.edad}', style: TextStyle(fontSize: 20)),
            // Agregar más detalles si es necesario
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await PetService().deletePet(pet.id);
          Navigator.pop(context); // Volvemos a la pantalla anterior
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
    );
  }
}
