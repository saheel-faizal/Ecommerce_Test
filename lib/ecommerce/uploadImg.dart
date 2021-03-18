import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImgSample extends StatefulWidget {
  @override
  _ImgSampleState createState() => _ImgSampleState();
}

class _ImgSampleState extends State<ImgSample> {


  File img;
  final picker = ImagePicker();


  Future getimage() async{
    try{
      final pickedimage = await picker.getImage(source: ImageSource.camera);


      if(pickedimage != null){
        setState(() {
          img = File(pickedimage.path);
        });
      }else{
        print("image picker failed");
      }
    }catch(e){
      print(e.message);
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: img != null?Image.file(img,height: 50,width: 150,fit: BoxFit.fill,):Text("No Image Found"),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(11)),),
        ),
        SizedBox(height: 20,),
        Center(
          child: GestureDetector(
            onTap: (){
              getimage();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(child: Text('Upload',style: TextStyle(color: Colors.white),)),),
          ),
        ),

      ],
    ) ,);
  }
}
