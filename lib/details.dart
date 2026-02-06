import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget{
  final data ;
  const ItemDetails({super.key, this.data});
  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}
class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar:
    BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined) ,label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag) ,label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person) ,label: ""),
        ]),
      endDrawer: Drawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shop , color: Colors.black,),
              Text(" Ecommerce" , style: TextStyle(color:Colors.black),),
              Text(" App" , style: TextStyle(color:Colors.deepOrange),),
            ],
          )
      ),
      body: ListView(
        children: [
          Image.network(widget.data["image"]),   //stateFullWidget
          Container(child: Text(widget.data["Name"] , textAlign: TextAlign.center
            ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20 ),)),

          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(widget.data["Description"] , textAlign: TextAlign.center
                ,style: TextStyle(color: Colors.grey ,fontSize: 18 ),)),

          Container(
              margin: EdgeInsets.only(top: 10 , bottom: 20),

              child: Text(widget.data["Price"] , textAlign: TextAlign.center
                ,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold
                    ,fontSize: 18 ),)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color : "),
              SizedBox(width: 10,),
              Container(height: 18 , width: 18 , decoration: BoxDecoration(
                  color: Colors.grey , borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.deepOrangeAccent ,width: 2 )
              ),) ,
              Text(" Grey    "),
              Container(height: 18 , width: 18 , decoration: BoxDecoration(
                  color: Colors.black , borderRadius: BorderRadius.circular(30)
              ),),
              Text(" Black"),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text("Size :  37    38   39   40   41" , textAlign: TextAlign.center,)),

          Container(
            margin:EdgeInsets.symmetric(horizontal: 60),
            child: MaterialButton(
              color: Colors.black,
              textColor: Colors.white,
              height: 40,
              onPressed: (){
              },
              child: Text("Add to Cart"),),
          )

        ],
      ),

    );
  }}
