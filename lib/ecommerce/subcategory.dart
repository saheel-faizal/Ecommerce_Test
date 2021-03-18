import 'package:flutter/material.dart';
import 'package:sample/ecommerce/ProductList.dart';
import 'package:get/route_manager.dart';
class SubCategory extends StatefulWidget {


  String subname;
  SubCategory({Key key, this.subname});


  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  final carimg=['Images/car.jpeg','Images/car1.jpeg','Images/car3.jpeg','Images/car2.jpeg',"Images/car4.jpeg"];
  final carname=['ford','ferrari','skoda','mitsubishi','toyota'];

  final bikeimg=['Images/bike.jpg','Images/bike2.jpg','Images/bike.jpg','Images/bike2.jpg','Images/bike.jpg'];
  final bikename=['suzuki','honda','yamaha','tvs','hero'];

  final busimg=['Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg'];
  final busname=['benz','tata','mazda','ll','ks'];

  final mobimg=['Images/shopping.png','Images/shopping.png','Images/shopping.png','Images/shopping.png','Images/shopping.png'];
  final mobname=['samsung','apple','nokia','one plus','motorola'];
  final display = [];
  final textdisp=[];



  @override
  Widget build(BuildContext context) {

    if(widget.subname == "car"){
      for(int i = 0;i<carimg.length;i++){
        display.add(carimg[i]);
        textdisp.add(carname[i]);

      }
    }else if(widget.subname=="bike"){
      for(int i=0;i<bikeimg.length;i++){
        display.add(bikeimg[i]);
        textdisp.add(bikename[i]);
      }

    }else if(widget.subname =="bus"){
      for(int i=0;i<busimg.length;i++){
        display.add(busimg[i]);
        textdisp.add(busname[i]);

      }
    }else{
      for(int i=0;i<mobimg.length;i++){
        display.add(mobimg[i]);
        textdisp.add(mobname[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          widget.subname,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
          itemCount: carimg.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 11.0
          ), itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: (){
                  Get.to(ProductList(name: textdisp[index],));
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(name: textdisp[index],)));
                },
                child: Container(
                  height: 110,
                  child: Column(
                    children: [
                      Image.asset(
                        display[index],width: 80,height: 80,),
                      SizedBox(height: 5,),
                      Text("${textdisp[index]}")
                    ],
                  ),
                ),
              ),
            );
      })
    );
  }
}
