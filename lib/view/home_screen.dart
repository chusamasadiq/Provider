import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/view/favourite_screen.dart';
import 'package:state_management/view/slider.dart';

import '../provider/count_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  // When we use SetState I rebuild or Update the Whole UI
  @override
  Widget build(BuildContext context) {
    //print('Stateful Widget');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Management (Provider)'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CountProvider>(
            builder: (context, value, child) {
              return Center(
                child: Text(
                  value.count.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SliderScreen(),
                ),
              );
            },
            child: const Text('Go to Slider Screen'),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            child: const Text('Go to Favourite Screen'),
          )
        ],
      ),
      floatingActionButton: Consumer<CountProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              value.setCount();
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
