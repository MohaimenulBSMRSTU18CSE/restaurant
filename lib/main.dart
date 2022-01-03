import 'package:flutter/material.dart';
import 'package:khadk_restaurant/data/foodProvider.dart';
import 'package:khadk_restaurant/foodCard.dart';
import 'package:khadk_restaurant/foodList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: FoodProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: Container(
            //padding: EdgeInsets.only(bottom: 6.0),
            decoration: BoxDecoration(color: Colors.grey),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(12.0)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.home,
                      size: 27,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(12.0)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.home,
                      size: 27,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(12.0)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.home,
                      size: 27,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(12.0)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.home,
                      size: 27,
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.green,
                  ),
                  Text('RASEL')
                ],
              ))
            ],
          )),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 55.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restaurant_menu),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Restaruant')
                    ],
                  ),
                ),
              ),
              FoodList()
            ],
          ),
        ),
      ),
    );
  }
}
