import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
final String coffeeType;
final bool isSelected;
final VoidCallback onTap;
const CoffeeType({super.key, 
  required this.coffeeType,
  required this.isSelected,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0), //canh lề trái dòng tn loại
        child: Text (
          coffeeType,
          style: TextStyle(
            fontSize: 15, //độ to nhỏ của tên loại
            fontWeight: FontWeight.bold,
            color:isSelected ? Colors.orange : Colors.white,
            ),
          ),
      ),
    );
  }
}