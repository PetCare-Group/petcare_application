import 'package:flutter/material.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/login.dart';
import 'package:petcare_application/pref/preference.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  preference pref=preference();
  final txtName=TextEditingController();
  final txtLastName=TextEditingController();
  final txtCel=TextEditingController();
  final txtDNI=TextEditingController();
  final txtMail=TextEditingController();
  final txtPass=TextEditingController();
  bool isSwitched = false;
  bool isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Text("Sign Up",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Color.fromRGBO(44, 52, 62, 1),
            ),),

            SizedBox(height: 15,),



            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 25.0,left: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Color.fromRGBO(251, 230, 88, 1)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: txtName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Ingrese Nombre',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 25.0,left: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Color.fromRGBO(251, 230, 88, 1)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: txtLastName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Ingrese Apellido',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none
                  ),
                ),
              ),
            ),

            Row(
              children: [
                Expanded(child:
                Padding(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0,left: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Color.fromRGBO(251, 230, 88, 1)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: txtCel,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'N° Celular',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                ),



                Expanded(child:
                Padding(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 25.0,left: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Color.fromRGBO(251, 230, 88, 1)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: txtDNI,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'DNI',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                ),


              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 25.0,left: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Color.fromRGBO(251, 230, 88, 1)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: txtMail,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Ingrese el correo electrónico',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 25.0,left: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Color.fromRGBO(251, 230, 88, 1)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: txtPass,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Ingrese la contraseña',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock),
                      border: InputBorder.none
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cliente', style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(44, 52, 62, 1),
                  fontWeight: FontWeight.w500,
                ),),

                Switch(value: isSwitched, onChanged: (value){
                  setState(() {
                    isSwitched=value;
                  });
                }),

                Text('Trabajador', style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(44, 52, 62, 1),
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),

            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: isCheckbox, onChanged: (value){
                    setState(() {
                      isCheckbox=value!;
                    });
                  }, ),
                  Text('Recordar Usuario',style: TextStyle(
                      color: Color.fromRGBO(44, 52, 62, 1),
                      fontSize: 16
                  ),)
                ],
              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Container(
                height: 40,
                child: ElevatedButton(onPressed: () async {

                  if(txtDNI.text.length==8 && txtPass.text.length>=4 && txtCel.text.length==9){
                    if(isCheckbox==true){
                      pref.user=txtMail.text.toString();
                      await pref.guardarUser();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context){
                          return home();
                        }));
                  }

                }, style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(103, 80, 164, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    )
                ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 95.0),
                    child: Text('Registrarse', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context){
                      return login();
                    }));
              },
              child: Text(
                'I have an account',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(103, 80, 164, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

          ],
        ),
      ),



    );
  }
  @override
  void initState() {
    pref.init().then((value){
      setState(() {
        pref=value;
      });
    });
  }
}
