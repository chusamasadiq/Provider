import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite Items'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: favouriteProvider.selectedItem.length,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
                builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }
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
