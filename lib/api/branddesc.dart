import 'package:flutter/material.dart';
import 'package:sample/Models/brandArray.dart';

class brandDesc extends StatefulWidget {
  List<brandArray> array1;
  int index;
  brandDesc({Key key,this.array1, this.index});
  
  
  @override
  _brandDescState createState() => _brandDescState();
}

class _brandDescState extends State<brandDesc> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.array1[widget.index].company),),
      body:
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Text(widget.array1[widget.index].position),),
              Container(child: Text(widget.array1[widget.index].description),),
              
            ],
          ),
        ],
      ),
    );
  }
}
