import 'package:flutter/material.dart';
import 'package:news_api/models/newsmodels.dart';


import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<News> latestNewsList = [];
  List<News> categoryNewsList = [];

  bool isLoading = false;
  bool isCategoryLoading = false;

  Future<void> getData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=26c0f3c1f9dd4a49a1d7b13195d00e67");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel res = newsScreenModelFromJson(response.body);
        latestNewsList = res.articles ?? [];
      }
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
  isCategoryLoading = true;
  notifyListeners();

  final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=$query&apiKey=26c0f3c1f9dd4a49a1d7b13195d00e67");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      NewsScreenModel searchNewsRes = newsScreenModelFromJson(response.body);
      categoryNewsList = searchNewsRes.articles ?? [];
    }
  } catch (e) {
    // Handle the error (optional)
  }

  isCategoryLoading = false;
  notifyListeners();
}
}