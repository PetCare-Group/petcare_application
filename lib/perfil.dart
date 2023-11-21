import 'package:flutter/material.dart';
import 'package:petcare_application/addpet.dart';
import 'package:petcare_application/configuration.dart';
import 'package:petcare_application/frequentquestions.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/login.dart';
import 'package:petcare_application/pref/preference.dart';

class perfil extends StatefulWidget {
  const perfil({super.key});

  @override
  State<perfil> createState() => _perfilState();
}

class _perfilState extends State<perfil> {
  late preference prefs; // La variable para manejar las preferencias
  final txtName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtCel = TextEditingController();
  final txtDireccion = TextEditingController();

  @override
  void initState() {
    super.initState();
    prefs = preference();
    prefs.init().then((_) {
      // Carga las preferencias en los controladores de texto
      setState(() {
        txtName.text = prefs.nombre;
        txtLastName.text = prefs.apellido;
        txtCel.text = prefs.celular;
        txtDireccion.text = prefs.direccion;
      });
    });
  }

  void _guardarDatos() {
    setState(() {
      prefs.nombre = txtName.text;
      prefs.apellido = txtLastName.text;
      prefs.celular = txtCel.text;
      prefs.direccion = txtDireccion.text;

      prefs.guardarNombres(txtName.text);
      prefs.guardarApellidos(txtLastName.text);
      prefs.guardarCelulars(txtCel.text);
      prefs.guardarDireccions(txtDireccion.text);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos actualizados correctamente')),
    );
  }

  void _confirmarEliminarCuenta() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar cuenta'),
          content: Text('¿Estás seguro de que deseas eliminar tu cuenta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            TextButton(
              child: Text('Confirmar'),
              onPressed: () async {
                await prefs.limpiarPreferenciasPerfil();
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
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
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
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
    body: Center(
    child: Container(
    width: 291,
    height: 540,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(11),
    color: Color.fromRGBO(103, 80, 164, 1),
    ),
    child: ListView(
    padding: EdgeInsets.all(16.0),
    children: [
    SizedBox(height: 10,),
    CircleAvatar(
    radius: 55,
    backgroundImage: NetworkImage('https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/05/Goku-nino-hace-cosplay-de-Arale-Naruto-y-Seiya-en-estas-tiernas-imagenes-compartidas-en-Twitter.jpg'),
    ),
    SizedBox(height: 10,),
    Text('First Name',style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    )),

    Padding(
    padding: EdgeInsets.only(top: 5.0,bottom: 15.0,right: 25.0,left: 25.0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Container(
    height: 42,
    child: TextFormField(
    controller: txtName,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    hintText: 'Ingrese su Nombre',
    filled: true,
    fillColor: Colors.white,enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    border: InputBorder.none
    ),
    ),
    ),
    ),
    ),


    Text('Last Name',style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    )),

    Padding(
    padding: EdgeInsets.only(top: 5.0,bottom: 15.0,right: 25.0,left: 25.0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Container(
    height: 42,
    child: TextFormField(
    controller: txtLastName,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    hintText: 'Ingrese su Apellido',
    filled: true,
    fillColor: Colors.white,enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    border: InputBorder.none
    ),
    ),
    ),
    ),
    ),


    Text('Número de Celular',style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    )),

    Padding(
    padding: EdgeInsets.only(top: 5.0,bottom: 15.0,right: 25.0,left: 25.0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Container(
    height: 42,
    child: TextFormField(
    controller: txtCel,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
    hintText: 'Ingrese su N° Celular',
    filled: true,
    fillColor: Colors.white,enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    border: InputBorder.none
    ),
    ),
    ),
    ),
    ),


    Text('Dirección',style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    )),

    Padding(
    padding: EdgeInsets.only(top: 5.0,bottom: 15.0,right: 25.0,left: 25.0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Container(alignment: AlignmentDirectional.centerStart,
    height: 42,
    child: TextFormField(
    controller: txtDireccion,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    hintText: 'Ingrese su Dirección',
    filled: true,
    fillColor: Colors.white,enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    border: InputBorder.none
    ),
    ),
    ),
    ),
    ),


    // Botón para guardar los datos
    ElevatedButton(
    onPressed: _guardarDatos,
    child: Text('Guardar datos'),
    style: ElevatedButton.styleFrom(
    primary: Color.fromRGBO(44, 52, 62, 1),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(7),
    ),
    ),
    ),
    // Botón para eliminar cuenta
      ElevatedButton(
        onPressed: _confirmarEliminarCuenta,
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(250, 43, 43, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Eliminar cuenta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

    ],
    ),
    ),
    ),
    );
  }
}

