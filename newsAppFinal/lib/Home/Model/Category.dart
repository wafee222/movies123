import 'dart:ui';
import '../MyTheme.dart';

class CategoryDM {

  String id ;
  String title ;
  String imagePath ;
  Color color ;

  CategoryDM({required this.id,
    required this.title,
    required this.imagePath,
    required this.color
  });

  /*
  science
  technology
   */
  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(id: 'sports', title: 'Sports', imagePath: 'assets/images/ball.png', color: MyTheme.redColor),
      CategoryDM(id: 'general', title: 'Politics', imagePath: 'assets/images/Politics.png', color: MyTheme.blueColor),
      CategoryDM(id: 'health', title: 'Health', imagePath: 'assets/images/health.png', color: MyTheme.pinkColor),
      CategoryDM(id: 'business', title: 'Business', imagePath: 'assets/images/bussines.png', color: MyTheme.brownColor),
      CategoryDM(id: 'entertainment', title: 'Entertainment', imagePath: 'assets/images/environment.png', color: MyTheme.blueColor),
      CategoryDM(id: 'technology', title: 'Technology', imagePath: 'assets/images/Politics.png', color: MyTheme.darkBlueColor),
      CategoryDM(id: 'science', title: 'Science', imagePath: 'assets/images/science.png', color: MyTheme.yellowColor),

    ];
  }

}