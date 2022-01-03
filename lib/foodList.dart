import 'package:flutter/material.dart';
import 'package:khadk_restaurant/data/foodProvider.dart';
import 'package:provider/provider.dart';

import 'foodCard.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  bool _isLoading = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isLoading == true) {
      Provider.of<FoodProvider>(context).getfoodData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<FoodProvider>(context).foodList;
    return foods.isEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      height: 300,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                childCount: 1),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, int index) => FoodCard(
                      name: foods[index].name,
                      images: foods[index].images,
                      rating: foods[index].rating,
                      totalTime: foods[index].totalTime,
                    ),
                childCount: foods.length),
          );
  }
}
