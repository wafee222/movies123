import 'package:flutter/material.dart';
import 'package:news/Home/Api/Api%20manager.dart';
import 'package:news/Model/newsResponce.dart';

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
