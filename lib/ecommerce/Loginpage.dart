import 'package:flutter/material.dart';
import 'package:sample/AuthService.dart';
import 'package:sample/api/Form.dart';
import 'package:sample/ecommerce/Homepage.dart';
import 'package:sample/ecommerce/view_address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CartPage2.dart';
import 'package:get/route_manager.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key=GlobalKey<FormState>();


  final AuthService _authService = AuthService();

  bool ob = true;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: key,
        child: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(margin:EdgeInsets.only(top: 150),
                child: Center(child: Text('LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 22),),),),
            SizedBox(height: 35,),
            Container(
              width: 380,
              child: TextFormField(
                controller: namecontroller,
                validator: (value){
                  if(value.isEmpty){
                    return "Username is Empty";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.account_circle),
                    hintText: "Enter Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17.0))),),
            ),

            SizedBox(height: 15,),

            Container(
              width: 380,
              child: TextFormField(
                controller: passwordcontroller,
                validator: (value){
                  if(value.isEmpty){
                    return "Password is Empty";
                  }
                  return null;
                },
                obscureText: ob,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(ob?Icons.visibility_off:Icons.remove_red_eye),
                      onPressed: (){
                        setState(() {
                          if(ob==true){
                            ob = false;
                          }else{
                            ob = true;
                          }
                        });
                      },
                  ),
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17.0))),),
            ),

            SizedBox(height: 35,),

            Container(
              width: 150,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                color: Colors.blue,
                onPressed:() async{

                  // FirebaseUser user = await _authService.authusingcred(namecontroller.text, passwordcontroller.text);
                  //
                  // if(user.getIdToken() == null){
                  //   print("user not created");
                  // }else{
                  //   print("create successfull");
                  // }

                  dynamic result = await _authService.loginwithemailpass(namecontroller.text, passwordcontroller.text);
                  print(result.email);
                  if(result.email != null){
                    Get.off(Homepage());
                  }
                  // setState(() {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
                  // });
                  // SharedPreferences pref = await SharedPreferences.getInstance();
                  // pref.setString('username', namecontroller.text);
                  //
                  // pref.setString('password', passwordcontroller.text);
                  // print('jhghgh');
                },
                child:Text('Submit',style: TextStyle(color: Colors.white),),),
            ),

          ],),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             GestureDetector(
               onTap: () async{
                 Get.to(FormEdit());
                 dynamic responce = await _authService.fireauthentication();

                 if(responce == null){
                   print("not signed in");
                 }else{
                   print("Success");
                 }

               },
               child: Container(
                 height: 50,
                 width: 150,
                 color: Colors.indigo,
                 child: Center(
                   child: Text("Continue Without Login",style: TextStyle(color: Colors.white),),
                 ),
               ),
             )
           ],
         )

        ],),
      ),
    );

  }
}
