import 'dart:convert';

import'package:flutter/material.dart';
import 'package:sample/Models/Album.dart';
import 'package:http/http.dart' as http;
class Fetch extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Fetch> {

  Future<Album> getdata() async{
    String url ="http://jsonplaceholder.typicode.com/albums/1";
    var response = await http.get(url);

    if(response.statusCode == 200){
      print(response.body);
      return Album.fromjson(jsonDecode(response.body));

    }else{
      print("Data unavailable");
    }
  }

  Future<Album> albumdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   albumdata = getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: albumdata,
        builder: (context,snapshot){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Text(snapshot.data.userId.toString()),),
              Container(child: Text(snapshot.data.title),),
              Container(child: Text(snapshot.data.id.toString()),),
            ],
          ),);
        },
      ),
    );
  }
}
