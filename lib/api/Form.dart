import 'package:flutter/material.dart';
import 'resultFetch.dart';
import 'package:http/http.dart' as http;

class FormEdit extends StatefulWidget {
  @override
  _FormEditState createState() => _FormEditState();
}

class _FormEditState extends State<FormEdit> {
  final key=GlobalKey<FormState>();

  TextEditingController namecontrol= new TextEditingController();
  TextEditingController desccontrol= new TextEditingController();
   senddata() async{
    String url = "https://tranquil-island-06779.herokuapp.com/products";
    var responce = await http.post(url,body: {
      "name": namecontrol.text,
      "desc": desccontrol.text,
    },
      headers: {
      "content-Type":"application/x-www-form-urlencoded"
      },
    );
     return responce;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(body: Form(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Edit Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[800]),),
        SizedBox(height: 20,),
        TextFormField(
          controller: namecontrol,
          validator: (value){
            if(value.isEmpty){
              return "Please enter name";
            }
            return null;
          },
          decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter product"),),
          SizedBox(height: 20,),
          TextFormField(
            controller: desccontrol,
            validator: (value){
              if(value.isEmpty){
                return "Please enter Description";
              }
              return null;
            },
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter Description"),),
          SizedBox(height: 20,),
          GestureDetector(onTap: (){
            if(key.currentState.validate()){
              senddata();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultFetch()));
            }

          },
            child: Container(color: Colors.green,
            height: 40,
            width: 100,
            child: Center(child: Text('Apply',style: TextStyle(color: Colors.white),)),),
          )
      ],),
    ),);
  }
}
