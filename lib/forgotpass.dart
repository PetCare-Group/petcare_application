import 'package:flutter/material.dart';
import 'package:petcare_application/login.dart';

class forgotpass extends StatefulWidget {
  const forgotpass({super.key});

  @override
  State<forgotpass> createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  final txtMail=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Text("Forgot Password",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Color.fromRGBO(44, 52, 62, 1),
            ),),
            SizedBox(height: 20,),
            Text("Enter your email associated with your Petcare account and we will send you a reset link",style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(44, 52, 62, 1),
            ),),
            SizedBox(height: 15,),
            Text("E-mail or phone number",style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(44, 52, 62, 1),
            ),),

            SizedBox(height: 15,),

            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 15.0),
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
                      border: InputBorder.none
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Container(
                  height: 42,
                  child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(103, 80, 164, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      )
                  ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65),
                      child: Text('Send me the link', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      )),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context){
                      return login();
                    }));
              },
              child: Center(
                child: Text(
                  'I have an account',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(103, 80, 164, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
