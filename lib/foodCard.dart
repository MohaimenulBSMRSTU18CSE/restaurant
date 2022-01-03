import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  FoodCard(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              image: NetworkImage(images),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
        Positioned(
          bottom: 8.0,
          left: 12.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(16.0)),
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8.0,
          right: 12.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(16.0)),
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  color: Colors.red,
                ),
                Text(
                  '${totalTime}',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
