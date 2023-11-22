import 'package:flutter/material.dart';
import 'package:petcare_application/api/ReviewService.dart';

class AddCommentScreen extends StatefulWidget {
  final int serviceId;

  const AddCommentScreen({Key? key, required this.serviceId}) : super(key: key);

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  int _stars = 1;

  void _submitComment() {
    if (_formKey.currentState!.validate()) {
      ReviewService.createReview(
        serviceId: widget.serviceId,
        description: _descriptionController.text,
        stars: _stars,
        userId: 17,
      ).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Comentario añadido con éxito')));
        Navigator.of(context).pop(true);
      }).catchError((error) {
        if (error is Exception) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al añadir comentario: $error')));
        } else {
          throw error;
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Comentario'),
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Comentario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un comentario';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _stars,
                items: List.generate(5, (index) {
                  return DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1} estrellas'),
                  );
                }),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _stars = newValue;
                    });
                  }
                },
                decoration: InputDecoration(labelText: 'Calificación'),
              ),

              ElevatedButton(
                onPressed: _submitComment,
                child: Text('Enviar Comentario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
