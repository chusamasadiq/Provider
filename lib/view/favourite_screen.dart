import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/favourite_provider.dart';

import 'myfavourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavouriteScreen()));
            },
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
                builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  value.addItem(index);
                },
                title: Text('Item $index'),
                trailing: value.selectedItem.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
              );
            });
          }),
    );
  }
}
