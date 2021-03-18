import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/Models/dataClass.dart';

class Data_Class extends StatefulWidget {
  @override
  _Data_ClassState createState() => _Data_ClassState();
}

class _Data_ClassState extends State<Data_Class> {
  Future<DataClass> getdata() async {
    String url = "https://reqres.in/api/users";

    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      return DataClass.fromJson(jsonDecode(responce.body));
    } else {
      print("no data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                List<Datum> arr = snapshot.data.data;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: arr.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network(arr[index].avatar),
                            title: Text(
                                arr[index].firstName + " "+ arr[index].lastName),
                            subtitle: Text(arr[index].email),
                          ),
                        );
                      });
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 200),
                      child: Center(child: CircularProgressIndicator()));
                }
              })
        ],
      ),
    );
  }
}
