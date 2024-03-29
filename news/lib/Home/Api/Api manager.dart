import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/Model/sourceResponce.dart';

import '../../Model/newsResponce.dart';
import 'Api constatns.dart';

class ApiManager {
  static Future<SourceResponce?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstats.baseUrl, ApiConstats.sourceApi, {
      'apiKey': '1f795339811446d2b9b0f1b579bcb8d6',
      'category': categoryId
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponce.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponce?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstats.baseUrl, ApiConstats.newApi, {
      'apiKey': '1f795339811446d2b9b0f1b579bcb8d6',
      'sources': sourceId
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponce.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponce?> searchNews(String query) async {
    Uri url = Uri.https(ApiConstats.baseUrl, ApiConstats.newApi, {
      'apiKey': '1f795339811446d2b9b0f1b579bcb8d6',
      'q': query
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponce.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
