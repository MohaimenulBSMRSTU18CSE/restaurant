import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:khadk_restaurant/data/food.dart';
import 'package:http/http.dart' as http;

class FoodProvider with ChangeNotifier {
  List<Food> _foodList = [];
  Future<void> getfoodData() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": '00300722cfmsh29f41a26655b667p1acbd0jsndeeed68c07cb',
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    if (response.statusCode == 200) {
      final getData = json.decode(response.body);
      List _tempList = [];
      for (var item in getData['feed']) {
        _tempList.add(item['content']['details']);
      }
      List<Food> _data = [];
      _tempList.forEach((element) {
        Food food = Food(
          name: element['name'] as String,
          images: element['images'][0]['hostedLargeUrl'] as String,
          rating: element['rating'] as double,
          totalTime: element['totalTime'] as String,
        );
        _data.add(food);
      });
      _foodList = _data;
      notifyListeners();
    } else {
      throw Exception();
    }
  }

  List<Food> get foodList => _foodList;
}
