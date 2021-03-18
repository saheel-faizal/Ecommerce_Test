import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
class ViewAddress extends StatefulWidget {
  String name;
  String email;
  String mobile;
  String city;
  String address;
  ViewAddress({Key key,this.name,this.email,this.mobile,this.city,this.address});
  @override
  _ViewAddressState createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
  final key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {



    TextEditingController namecontroller = new TextEditingController(text: widget.name);
    TextEditingController emailcontroller = new TextEditingController(text: widget.email);
    TextEditingController mobilecontroller = new TextEditingController(text: widget.mobile);
    TextEditingController citycontroller = new TextEditingController(text:widget.city);
    TextEditingController addresscontroller = new TextEditingController(text: widget.address);

    void getdata() async{

      SharedPreferences preference = await SharedPreferences.getInstance();
      preference.setString('name',namecontroller.text);
      preference.setString('email', emailcontroller.text);
      preference.setString('mobile', mobilecontroller.text);
      preference.setString('city', citycontroller.text);
      preference.setString('address',addresscontroller.text);
      print(preference.getString('mobile'));
      print(preference.getString('name'));
      print(preference.getString('email'));
      print(preference.getString('city'));
      print(preference.getString('address'));

    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
      title: Text('Address',style: TextStyle(color: Colors.deepOrange),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Theme(
            data: new ThemeData(primaryColor: Colors.deepOrange,),
            child: Column(
              children: [

                Form(
                  key: key,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 4,),
                      TextFormField(
                        controller: namecontroller,
                        validator: (value){
                          if(value.isEmpty){
                            return "namefield is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter your Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),),
                      SizedBox(height: 5,),
                      Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 4,),
                      TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                        if(value.isEmpty){
                          return "Please Type Email";
                        }
                        return null;
                        },

                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Enter your Email",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),),
                      SizedBox(height: 5,),

                      Text('Mobile',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 4,),
                      TextFormField(
                        controller: mobilecontroller,
                        validator: (value){
                          if(value.isEmpty){
                            return "enter you mobile no";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,

                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Enter your Mobile number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),),
                      SizedBox(height: 5,),
                      Text('Locality / city',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 4,),
                      TextFormField(
                        controller: citycontroller,
                        validator: (value){
                          if(value.isEmpty){
                            return "enter your city";
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Enter your City ",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),),
                      SizedBox(height: 5,),
                      Text('Address',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 4,),
                      TextFormField(
                        controller: addresscontroller,
                        validator: (value){
                          if(value.isEmpty){
                            return "enter your Address";

                          }
                          return null;                        },

                        maxLines: 5,
                        decoration: InputDecoration(

                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Enter your Address",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),),

                      GestureDetector(
                        onTap: (){
                          getdata();
                          if(key.currentState.validate()){
                          }
                          setState(() {
                            Navigator.pop(context);
                          });

                        },
                        child: Container(height: 50,width: 150,margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.deepOrange[400]),
                            child: Center(child: Text('Save Changes',style: TextStyle(color: Colors.white,fontSize: 16),))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
