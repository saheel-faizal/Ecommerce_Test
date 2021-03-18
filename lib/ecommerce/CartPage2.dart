import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:sample/ecommerce/placeorder.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity=0;
  int price=250;
  int total=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      title: Text('Cart',style: TextStyle(color: Colors.deepOrange),),),
    body: ListView(children: [
      ListView.builder(itemCount:2,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset('Images/shopping.png'),
                    title: Text('Smartphone'),
                    trailing:Container(
                      width: 120,
                      child: Row(
                        children: [

                          GestureDetector(
                            onTap: (){
                              setState(() {
                                quantity++;
                                total=total+price;

                              });
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border:Border.all(color: Colors.green) ),
                                child: Icon(Icons.add,color: Colors.white,)),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Text(quantity.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                if(total > 0){
                                  quantity--;
                                  total=total-price;
                                }
                              });
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border:Border.all(color: Colors.red) ),
                                child: Icon(Icons.remove,color: Colors.white,)),
                          )
                        ],
                      ),
                    ),
                    subtitle: Text(price.toString()),
                  ),
                ),
              ],
            );
          }),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.blueGrey,
                  borderRadius:BorderRadius.circular(12.0)
              ),
              child: Center(
                child: Text('Total Price: '+total.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
              ),
              width: 150,
              height: 50,
            ),
            SizedBox(width: 90,),
            GestureDetector(
              onTap: (){
                if(quantity==0){

                  showDialog(context: context,
                      builder:(context){
                        return AlertDialog(
                          title: Text('Cart'),
                          content: Container(

                            child: Row(
                              children: [

                                //Text('Your Cart is Empty!'),
                                Image.asset('Images/download.png',
                                  width: 250,
                                  height: 150,),
                              ],
                            ),
                          ),
                          actions: [
                            RaisedButton(child: Text('OK'),
                              color: Colors.blue,
                              onPressed:(){
                                Navigator.pop(context);
                              },)
                          ],
                        );
                      }
                  );



                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder(itemcount: 2,itemprice: price,total: total,itemname: 'Smartphone',img: 'Images/shopping.png',)));

                }

                

              },
              child: Container(height: 50,
                width: 150,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.deepOrange[400],
                    borderRadius: BorderRadius.circular(22.0)),

                child: Center(
                  child: Text('Place Order',style: TextStyle(color: Colors.white),)
                  ,)
                ,),
            ),

          ],
        ),
      )
    ],),
    );
  }
}
