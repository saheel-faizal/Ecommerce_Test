import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/api/branddesc.dart';

import '../Models/brandArray.dart';

class brandFetch extends StatefulWidget {
  @override

  _brandFetchState createState() => _brandFetchState();
}

class _brandFetchState extends State<brandFetch> {
  Future<List<brandArray>> branddata() async {
    String url = "https://mock-json-service.glitch.me/";
    var response = await http.get(url);
    List<brandArray> arr = [];
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      for (var i in jsondata) {
        brandArray data = brandArray(
            i['company'],
            i['description'],
            i['employementType'],
            i['id'],
            i['location'],
            i['position']
        );
        arr.add(data);
      }

    }
    else{
      print('no connection');
    }
    return arr;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    branddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FutureBuilder(
            future: branddata(),
            builder: (context,snapshot){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => brandDesc(array1: snapshot.data,index: index)));
                    },
                    child: ListTile(
                      leading: Text(snapshot.data[index].id.toString()),
                      title: Text(snapshot.data[index].company),
                      subtitle: Text(snapshot.data[index].position),
                      trailing: Text(snapshot.data[index].location),

                    ),
                  );
                  });
            },
          )

        ],
      ),
    );
  }
}
