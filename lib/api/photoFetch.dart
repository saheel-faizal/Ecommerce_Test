import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample/Models/photoClass.dart';
import 'package:http/http.dart' as http;

class photoFetch extends StatefulWidget {
  @override
  _photoFetchState createState() => _photoFetchState();
}

class _photoFetchState extends State<photoFetch> {
  Future<List<photoClass>> photodata() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    var response = await http.get(url);
    List<photoClass> arr = [];
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      for (var i in jsondata) {
        photoClass data = photoClass(
            i['albimId'], i['id'], i['title'], i['url'], i['thumbnailUrl']);
        arr.add(data);
      }
    } else {
      print('no data');
    }
    return arr;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    photodata();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
        FutureBuilder(
            future: photodata(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(snapshot.data[index].thumbnailUrl),
                          title: Text(snapshot.data[index].title),
                        ),
                      );
                    });
              }else{
                return Container(
                  margin: EdgeInsets.only(top:250 ),
                    child: Center(child: CircularProgressIndicator(backgroundColor: Colors.red,)));
              }

            })
      ],),
    );
  }
}
