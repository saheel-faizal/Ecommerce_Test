import 'package:flutter/material.dart';

class CartTile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CartTileState();
  
}

class CartTileState extends State<CartTile>{

  int value = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.all(8.0),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset("Images/shopping.png",width: 80,height: 100,),
            title: Text("Smartphone"),
            trailing: Container(
              width: 110,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        value++;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                  Text(value.toString()),
                  GestureDetector(
                    onTap: (){
                     setState(() {
                       value--;
                     });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 18.0),
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Icon(Icons.minimize),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      )
    ),
    );
  }
}