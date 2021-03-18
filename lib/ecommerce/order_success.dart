import 'package:flutter/material.dart';

class OrderSuccess extends StatefulWidget {
  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Image.asset('Images/order.png',height: 100,),
          SizedBox(height: 10,),
          Center(child: Text('Order Place Successfully',style: TextStyle(color:Colors.blueGrey,fontSize: 25),))

      ],),
    );
  }
}



