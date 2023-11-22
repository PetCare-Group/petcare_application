import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/api/Question.dart';
import 'package:petcare_application/api/QuestionService.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/myservices.dart';

class FrequentQuestions extends StatefulWidget {
  const FrequentQuestions({Key? key}) : super(key: key);

  @override
  State<FrequentQuestions> createState() => _FrequentQuestionsState();
}

class _FrequentQuestionsState extends State<FrequentQuestions> {
  List<Question> questions = [];
  List<Question> filteredQuestions = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    var fetchedQuestions = await QuestionService.fetchQuestions();
    setState(() {
      questions = fetchedQuestions;
      filteredQuestions = fetchedQuestions;
    });
  }

  void filterQuestions(String enteredText) {
    List<Question> results;
    if (enteredText.isEmpty) {
      results = questions;
    } else {
      results = questions
          .where((question) => question.question.toLowerCase().contains(enteredText.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredQuestions = results;
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
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),
        title: Text("Ayuda", style: TextStyle(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => addpet()),
                  );
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

                },
              ),
            ],
          ),
        ),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Buscar pregunta',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: filterQuestions,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredQuestions.length,
              itemBuilder: (context, index) {
                Question question = filteredQuestions[index];
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Pregunta ${question.id}', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(question.question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 8.0),
                        Text(question.answer),
                      ],
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
