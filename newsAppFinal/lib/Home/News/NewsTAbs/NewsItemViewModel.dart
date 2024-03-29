import 'package:flutter/material.dart';
import 'package:newsappfinal/Home/Api/ApiManager.dart';
import 'package:newsappfinal/Home/Model/NewsResponce.dart';

class NewsWidgetNewsModel extends ChangeNotifier {
  List<News>? newList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newList = response!.articles;
      }
    } catch (e) {
      errorMessage = 'error';
    }
  }
}
