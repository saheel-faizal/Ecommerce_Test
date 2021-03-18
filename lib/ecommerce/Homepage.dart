import 'package:flutter/material.dart';
import 'package:sample/ecommerce/Loginpage.dart';
import 'package:sample/ecommerce/subcategory.dart';
import 'package:get/route_manager.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final Listitem = ["bike", "car", "bus", "mobile"];
    final Imageitems = [
      "Images/bike.jpg",
      "Images/car.jpeg",
      "Images/bus.jpeg",
      "Images/shopping.png"
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrangeAccent[200],
        title: Text('Home'),
        actions: [GestureDetector(onTap: (){
          Get.off(LoginPage());
        },
          child: Container(
            child: Row(
              children: [
                Text('Logout'),
                IconButton(icon: Icon(Icons.login_outlined), onPressed: (){

                }),
              ],
            ),
          ),
        )],
      ),
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: Listitem.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubCategory(
                                  subname: Listitem[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        leading: Image.asset(
                          Imageitems[index],
                          width: 70,
                        ),
                        title: Text("${Listitem[index]}")),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
