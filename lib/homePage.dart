import 'package:flutter/material.dart';
import 'package:smart_store/details.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  List categoriesItem = [
    {"IconName" : Icons.laptop , "Title": "Laptop" },
    {"IconName" : Icons.phone_iphone , "Title": "Phone" },
    {"IconName" : Icons.usb_rounded , "Title": "USB" },
    {"IconName" : Icons.card_giftcard_outlined , "Title": "Gift" },
    {"IconName" : Icons.electrical_services , "Title": "Services" },
  ];

  List items = [
    {"image": "https://images-na.ssl-images-amazon.com/images/I/41Wa1ee-auS._SL500_._AC_SL500_.jpg"
      ,"Name" : "HeadPhone" , "Description": "Description 1 " , "Price": "450\$" },
    {"image":"https://cdn-img.oraimo.com/fit-in/360x360/EG/product/2025/04/04/OSW-810.png",
      "Name" : "Apple Watch" , "Description": "Description 2 " , "Price": "260\$" },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(
          iconSize: 35,
          selectedItemColor: Colors.deepOrange,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined) ,label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag) ,label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person) ,label: ""),
          ]),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.search),  //Hide Border
                      hintText: "Search" ),
                ),),

              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.menu , size: 40,))
            ],),
          //..........................................
          Container(height: 20,),
          Text("Categories" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
          Container(height: 12,),
          //..........................................
          Container(
            height: 100,
            child: ListView.builder(
              itemCount:categoriesItem.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context , i){
                return Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon( categoriesItem[i]["IconName"], size: 45,),
                    ),
                    Text(categoriesItem[i]["Title"], style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[800]),)
                  ],),);
              },
            ),
          ),
          //.........................................

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Best Selling" ,
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
          ),
          //...............................................
          GridView.builder(
            itemCount: items.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisExtent: 230),
            itemBuilder:(context  , i) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ItemDetails(data : items[i])));
                },
                child:Card(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[200],
                      child: Image.network(items[i]["image"] ,
                        height: 110 , fit: BoxFit.fill,),),
                    Text(items[i]["Name"],style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20), ),
                    Text(items[i]["Description"],style: TextStyle(color: Colors.grey , fontSize: 14), ),
                    Text(items[i]["Price"],style: TextStyle(color: Colors.deepOrange , fontSize:14 , fontWeight: FontWeight.bold
                    ), ),],),),
              );
            },)
        ],),
      ),
    );
  }
}