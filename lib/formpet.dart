import 'package:flutter/material.dart';
import 'package:petcare_application/api/PetService.dart';
import 'addpet.dart';

class FormPet extends StatefulWidget {
  @override
  _FormPetState createState() => _FormPetState();
}

class _FormPetState extends State<FormPet> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Mascota'),
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre de la mascota'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la edad';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var newPet = {
                      "name": nameController.text,
                      "description": descriptionController.text,
                      "edad": int.tryParse(ageController.text) ?? 0,
                      "castrado": 1,
                      "userId": 1,
                    };

                    await PetService().addPet(newPet);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => addpet()),
                    );
                  }
                },
                child: Text('Registrar Mascota'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
