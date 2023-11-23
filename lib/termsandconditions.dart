import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/frequentquestions.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/myservices.dart';

class TermsAndConditionsScreen extends StatelessWidget {
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
        title: Text("Términos y Condiciones", style: TextStyle(
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
                },
              ),
            ],
          ),
        ),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Introducción\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Bienvenido a PetCare. Estos términos y condiciones de uso rigen '
                  'la relación entre PetCare y sus usuarios. Al utilizar nuestra plataforma, '
                  'usted acepta estos términos en su totalidad. Si no está de acuerdo con '
                  'parte o la totalidad de los mismos, no debe usar nuestra aplicación.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('2. Servicios Ofrecidos\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('PetCare ofrece una plataforma para la conexión entre dueños de mascotas '
                  'y proveedores de servicios para mascotas, incluyendo pero no limitado '
                  'a paseos, adiestramiento y atención veterinaria.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('3. Registro y Cuenta\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Para acceder a ciertos servicios, deberá crear una cuenta proporcionando '
                  'información veraz y completa. Es responsable de mantener la confidencialidad '
                  'de su cuenta y contraseña y de restringir el acceso a su computadora o dispositivo.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('4. Política de Privacidad\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('La protección de sus datos personales es de suma importancia para nosotros. '
                  'La recopilación y uso de información personal se rige por nuestra Política '
                  'de Privacidad, la cual es parte integrante de estos términos.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('5. Modificaciones del Servicio y Precios\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Los precios de los servicios están sujetos a cambios sin previo aviso. '
                  'Nos reservamos el derecho de modificar o discontinuar el servicio en cualquier '
                  'momento, sin responsabilidad alguna hacia el usuario o terceros.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('6. Cancelación de Servicios\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Los usuarios pueden cancelar los servicios contratados siguiendo el proceso '
                  'establecido en la aplicación. En caso de cancelación, se deben respetar los '
                  'plazos y condiciones especificadas para cada tipo de servicio.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('7. Derechos de Autor\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Todo el contenido incluido en la aplicación, como textos, gráficos, logos, '
                  'iconos, imágenes y software, es propiedad de PetCare o sus proveedores de contenido '
                  'y está protegido por leyes de derechos de autor internacionales.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('8. Ley Aplicable\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Estos términos y condiciones se regirán e interpretarán de acuerdo con las leyes '
                  'del país de origen de PetCare, sin dar efecto a ninguna elección o conflicto de '
                  'provisiones legales o normativas.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),


              Text('9. Contacto\n',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),

              Text('Si tiene alguna pregunta acerca de estos términos y condiciones, por favor contacte '
                  'con nosotros a través de la sección de ayuda en la aplicación.\n\n',textAlign: TextAlign.justify,style: TextStyle(fontSize: 15, wordSpacing: 1.5),),

              Text('Gracias por utilizar PetCare.',style: TextStyle(fontSize: 17, wordSpacing: 1.5, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
