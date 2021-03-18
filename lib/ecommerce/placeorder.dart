import 'package:flutter/material.dart';
import 'package:sample/ecommerce/order_success.dart';
import 'package:sample/ecommerce/view_address.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PlaceOrder extends StatefulWidget {
  int itemcount;
  int total;
  int itemprice;
  String itemname;
  String img;
  PlaceOrder({Key key,this.itemcount,this.itemprice,this.total,this.itemname,this.img});
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  int selectfirst = 0;
  int selectsecond = 0;
  bool vis = false;
  String name = "";
  String email = "";
  String mobile="";
  String city="";
  String address= "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text('Place Order',
          style: TextStyle(
              color: Colors.deepOrange),),),
      body: ListView(children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.itemcount,
            itemBuilder: (context,index){
            return Column(children: [
              ListTile(title: Text(widget.itemname),
              leading: Image.asset(widget.img),
              subtitle: Text(widget.itemprice.toString()),),
            ],);
            }),

        ListTile(
          leading: Radio(
            activeColor: Colors.deepOrange,
            value: selectfirst,
            groupValue: 1,
            onChanged: (value){
              setState(() {
                selectfirst = 1;
                selectsecond = 0;
              });
            },
          ),
          title: Text("COD"),
        ),
        ListTile(
          leading: Radio(

            activeColor: Colors.deepOrange,
            value: selectsecond,
            groupValue: 1,
            onChanged: (value){
              setState(() {
                selectsecond=1;
                selectfirst=0;
              });
            },
          ),
          title: Text('Pay Online'),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              if(selectfirst==0 && selectsecond==0){
                showDialog(context: context,
                builder: (context){
                  return AlertDialog(title: Text('Payment'),
                  content: Text('Please select pay method'),);
                });

              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSuccess(),));
              }
            },
            child: Container(child: Center(
                child: Text('Checkout',
                  style: TextStyle(color: Colors.white),)),
            width: 150,
            height: 50,
            color: Colors.teal,),
          )],),

        SizedBox(height: 20,),

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  name = prefs.getString('name');
                  email= prefs.getString('email');
                  mobile=prefs.getString('mobile');
                  city= prefs.getString('city');
                  address=prefs.getString('address');
                  if(vis==false){
                    vis = true;
                  }else{
                    vis= false;
                  }

                });

              // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAddress(),));
              },
              child: Container(color:Colors.deepOrange[300],
                child: Center(child: Text("View Address",style: TextStyle(color: Colors.white,fontSize: 18),)),
                height: 50,width: 250,),
            ),SizedBox(width: 3,),
            GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAddress(name: name,email: email,mobile: mobile,city: city,address: address,),));
                });
              },
              child: Container(color: Colors.teal[200],
                height: 50,
                width: 170,
                child: Center(
                  child: Text('Edit Address',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),

        Visibility(
          visible: vis,
          child: Container(
            color: Colors.grey[200],
            height: 200,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Name: ',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 10,),
                  Text("Email: ",style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                  Text('Mobile: ',style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                  Text("City: ",style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                  Text('Address: ',style: TextStyle(fontSize: 18)),

                ],),

                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(name,style: TextStyle(fontSize: 18),),
                    SizedBox(height: 10,),
                    Text(email,style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                    Text(mobile,style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                    Text(city,style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                    Text(address,style: TextStyle(fontSize: 18)),

                  ],),

              ],
            ),
          ),
        ),









      ],),
    );
  }
}
