import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/Models/MultipleData.dart';

class dataFetch extends StatefulWidget {
  @override
  _dataFetchState createState() => _dataFetchState();
}



class _dataFetchState extends State<dataFetch> {

  Future<List<multipleData>> newdata() async{
    String url="http://jsonplaceholder.typicode.com/posts";
    var response = await http.get(url);
    List<multipleData> arr = [];
    if(response.statusCode == 200){
      var jsonresponce = json.decode(response.body);


      for(var i in jsonresponce){
        multipleData data = multipleData(
          i["userId"],
          i["id"],
          i["title"],
          i["body"]
        );
       arr.add(data);
      }

    }else{
      print("no connection");
    }

    return arr;

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
              future: newdata(),
              builder: (context,snapshot){
              return ListView.builder(
                physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                   return ListTile(
                     leading: Text(snapshot.data[index].id.toString()),
                     title: Text(snapshot.data[index].title),
                     trailing: Text(snapshot.data[index].userId.toString()),
                   );
              });
          })
        ],
      ),
    );
  }
}

