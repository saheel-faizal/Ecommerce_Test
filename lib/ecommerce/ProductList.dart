import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  String name;
  ProductList({Key key,this.name});
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final carmodelimg=['Images/car.jpeg','Images/car1.jpeg','Images/car3.jpeg','Images/car2.jpeg',"Images/car4.jpeg"];
  final carmodelname=['mustang','ecosport','skoda','mitsubishi','toyota'];

  final bikemodelimg=['Images/bike.jpg','Images/bike2.jpg','Images/bike.jpg','Images/bike2.jpg','Images/bike.jpg'];
  final bikemodelname=['suzuki','splender','activa','ntorq','passionplus'];

  final busmodelimg=['Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg'];
  final busmodelname=['benz','tata','mazda','ll','ks'];

  final mobmodelimg=['Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg','Images/bus.jpeg'];
  final mobmodelname=['benz','tata','mazda','ll','ks'];

  final offer=["upto\n 50%","upto\n 60%","upto\n 55%","upto\n 44%","upto\n 36%"];

  List<String> modelimgdisp=[];
  List<String> modelnamedisp=[];


  @override
  Widget build(BuildContext context) {


    //BIKE MODEL
    if(widget.name == "suzuki"){
      modelimgdisp = List.from(bikemodelimg);
      modelnamedisp = List.from(bikemodelname);
    }else if(widget.name == "honda"){
      modelimgdisp = List.from(bikemodelimg);
      modelnamedisp = List.from(bikemodelname);
    }else if(widget.name == "yamaha"){
      modelimgdisp = List.from(bikemodelimg);
      modelnamedisp = List.from(bikemodelname);
    }else if(widget.name == "tvs"){
      modelimgdisp = List.from(bikemodelimg);
      modelnamedisp = List.from(bikemodelname);
    }else{
      modelimgdisp = List.from(bikemodelimg);
      modelnamedisp = List.from(bikemodelname);
    }

    //CAR MODEL
    if(widget.name=="ford"){
      modelimgdisp =List.from(carmodelimg);
      modelnamedisp=List.from(carmodelname);
    }





    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(color: Colors.blue),),
      backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount:modelimgdisp.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            itemBuilder: (context,index){
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                child: Column(children: [
                  Image.asset(modelimgdisp[index],width: 80,height: 110,),
                  Text('${modelnamedisp[index]}')
                ],),
                width: 135,
                height: 135,),
                Positioned(
                  right: 1,
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.green,
                      child: Center(
                        child: Text("${offer[index]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    )
                )
              ],
            );

            }),
      ),
    );
  }
}
