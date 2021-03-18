import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/Models/resultClass.dart';
import 'package:sample/api/Form.dart';

class ResultFetch extends StatefulWidget {
  @override
  _ResultFetchState createState() => _ResultFetchState();
}

class _ResultFetchState extends State<ResultFetch> {
  Future<ResultClass> resultdata() async{
    String url="https://tranquil-island-06779.herokuapp.com/products";
    var response=await http.get(url);
    if(response.statusCode==200){
      return ResultClass.fromJson(jsonDecode(response.body));
    }else{
      print('no data');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
            future: resultdata(),
              builder: (context,snapshot){
              if(snapshot.hasData) {
                List <Result> arr = snapshot.data.result;
                return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: arr.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          subtitle: Text(arr[index].desc.toString()),
                          title: Text(arr[index].name.toString()),
                        ),
                      );
                    });
              }else{
                return Container(margin: EdgeInsets.only(top: 300),
                    child: Center(child: CircularProgressIndicator()));
              }

          })

      ],),
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.add),
       backgroundColor: Colors.red,
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> FormEdit()));

        },
      ),
    );
  }
}
