
import 'package:coffeappui/util/coffee_tile.dart';
import 'package:coffeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage ({ Key? key}): super (key: key);

  @override
  State<HomePage > createState() => _HomePageState();
}

class _HomePageState extends State<HomePage > {

  //list of coffee types

  final List coffeeType = [

    // [ coffee type, isSelected ]
    ['Cappucino' ,
     true,
     ],
    ['Latte' , 
    false,
    ],
    ['Black' , 
    false,
    ],
    ['Tea' ,
     false,
     ],
  ];

  //user tapped on coffee types

  void coffeeTypeSelected(int index) {
    setState(() {

      //this for loop makes every selection false
      for(int i=0; i<coffeeType.length; i++){
        coffeeType[i][1] = false;

      }
      coffeeType[index][1] = true;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:const Icon(Icons.menu),
        actions:const [
          Padding(
            padding: EdgeInsets.only(right: 20.0), //canh lề phải của ký hiệu avatar
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
          label: 'Heart',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
          label: 'Notification',
          )
          ],
        ),
      body: Column(children: [
        //Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0), //canh lề trái của dòng chữ
          child: Text(
            "Find the best coffee for you",
          style: GoogleFonts.bebasNeue(
            fontSize: 35, //độ to nhỏ của chữ
          ),
          ),
        ),
        const SizedBox(height: 5), //khoảng cách trên của thanh search
      //Search Bar
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0), //canh lề trái thanh search
        child: TextField(
          decoration: InputDecoration(
            prefixIcon:const Icon(Icons.search),
            hintText: 'Find your coffee..', 
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
            ),
          ),
        ),
      ),
        const SizedBox(height: 10), //khoảng cách trên của thanh tên loại

        SizedBox(
          height: 25, //khoảng cách trên của card giá thức uống
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:coffeeType.length ,
            itemBuilder: (context,index){
            return CoffeeType(
              coffeeType: coffeeType[index][0],
               isSelected: coffeeType[index][1],
                onTap: (){
                  coffeeTypeSelected(index);
                },
                );
          },
          ),
        
          ),

           Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal ,
              children:const [
              CoffeeTile(
                coffeeImagePath: 'images/latte.jpg',
                coffeeName: 'Latte' ,
                coffeePrice:'4.20' ,
              ), 
              CoffeeTile(
                coffeeImagePath: 'images/capu.jpg',
                coffeeName: 'Cappucino' ,
                coffeePrice:'4.10' ,
              ),
              CoffeeTile(
                coffeeImagePath: 'images/milk.jpg',
                coffeeName: 'Milk Coffee thing' ,
                coffeePrice:'4.60' ,
              ),
            ],
            ),
           ),
      ]),
    );
  }
}