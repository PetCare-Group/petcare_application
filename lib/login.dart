import 'package:flutter/material.dart';
import 'package:petcare_application/forgotpass.dart';
import 'package:petcare_application/generated/assets.dart';
import 'package:petcare_application/home.dart';
import 'package:petcare_application/pref/preference.dart';
import 'package:petcare_application/register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  preference pref=preference();
  final txtMail=TextEditingController();
  final txtPass=TextEditingController();
  bool isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Sign In",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Color.fromRGBO(44, 52, 62, 1),
            ),),

            SizedBox(height: 15,),

            Image(image: AssetImage(Assets.imagesLogin),height: 170,),



            SizedBox(height: 10,),





            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 15.0,right: 25.0,left: 25.0),
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
              padding: EdgeInsets.only(top: 5,bottom: 15.0,right: 25.0,left: 25.0),
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
                      border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 42,
                child: ElevatedButton(onPressed: (){

                  if((txtMail.text=="hiro@gmail.com" && txtPass.text=="hola123")||(txtMail.text=="xd@gmail.com" && txtPass.text=="chau123")||(txtMail.text=="eduardo@gmail.com" && txtPass.text=="eduardo")){
                    if(isCheckbox==true){
                      pref.user=txtMail.text.toString();
                      pref.guardarUser();
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
                    child: Text('Iniciar Sesión', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )),
                  ),
                ),
              ),
            ),



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

            SizedBox(height: 20,),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context){
                      return forgotpass();
                    }));
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(103, 80, 164, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),


            SizedBox(height: 20,),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context){
                      return register();
                    }));
              },
              child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(103, 80, 164, 1),
                    fontWeight: FontWeight.w500,
                  )),
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
        txtMail.text=pref.user;
      });
    });
  }


}