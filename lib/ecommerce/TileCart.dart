import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  int quantity = 0;


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset('Images/shopping.png'),
          title: Text('Smartphone'),
            trailing:Container(
              width: 150,
              child: Row(
                children: [

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        quantity++;
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
                        quantity--;
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
            subtitle: Text('RS 11250'),
          ),
        ),
      ],
    );
  }
}
