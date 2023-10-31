import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/modelclass.dart';
import 'package:http/http.dart' as http;

class Homecontroller with ChangeNotifier {
  Newsmodelclass? responseData;
  Future fetchData() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=181c30b68deb408b927f5d77bb3b2cf9');
    var response = await http.get(url);
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    responseData = Newsmodelclass.fromJson(jsonDecode(response.body));
    print(responseData);
    notifyListeners();
  }
}
