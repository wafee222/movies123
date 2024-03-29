import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/Category.dart';
import 'CategoryItem.dart';



class CategoryFragment extends StatelessWidget {

  var categoriesList = CategoryDM.getCategories();
  var onCategoryItemClink ;
  CategoryFragment({required this.onCategoryItemClink});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category of content',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 175, // Increased height of each item
                crossAxisSpacing: 20, // Reduced spacing between items
                mainAxisSpacing: 10, // Added spacing between rows
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onCategoryItemClink(categoriesList[index]
                    );
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
