import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
 final String coffeeImagePath;
 final String coffeeName;
 final String coffeePrice;


const CoffeeTile({super.key, 
  required this.coffeeImagePath,
  required this.coffeeName,
  required this.coffeePrice,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left : 15.0,bottom: 15), //canh lề trái của khung card và độ to ra của khung dưới
                child: Container(
                  padding: const EdgeInsets.all(15), //độ to nhỏ của inf card
                  width: 150, //độ to nhỏ của khung inf
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), //bo viền khung card
                  color: Colors.black54,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //coffee image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), //bo viền card
                        child: Image.asset(coffeeImagePath),
                        ),

                        //coffee name
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8), //canh lề dưới của 2 ký tự và canh lề trái 2 dòng tên thức uống
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            coffeeName,
                         style:const TextStyle(fontSize: 15), //độ to nhỏ của dòng chữ tên thức uống trên card
                         ),
                            const SizedBox(
                          height: 3, //chiều cao của tên thức uống trên card
                         ),
                         Text(
                          'With Milk',
                          style:TextStyle(color: Colors.grey[700]),
                         ),
                         ],
                         ),
                       ),

                       //price
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal:10.0), //số lớn thì càng nhỏ khoảng cách giữa 2 ký tự giá và nút add
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Text('\$$coffeePrice'),
                         Container(
                          padding:const EdgeInsets.all(5), //độ lớn nhỏ của 2 ký tự
                          decoration: BoxDecoration(color: Colors.orange,
                          borderRadius: BorderRadius.circular(10), //độ bo viền của ký tự add
                          ),
                          child:const Icon(Icons.add),
                         ),
                         ],
                         ),
                       )
                    ],
                  ),
                ),
    );
  }
}