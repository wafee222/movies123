import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Model/Category.dart';

class CategoryItem extends StatelessWidget {
 final CategoryDM category;
 final int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Center( // Center horizontally
            child: Image.asset(
              category.imagePath,
              // You can set width and height constraints for the image if needed
            ),
          ),
          SizedBox(height: 8), // Added some space between the image and text
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
