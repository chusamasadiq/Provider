import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/slider_provider.dart';
import 'package:state_management/view/slider.dart';
import 'view/home_screen.dart';

void main() {
  runApp(const StateManagement());
}

class StateManagement extends StatelessWidget {
  const StateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider()),
        ChangeNotifierProvider<SliderProvider>(create: (_) => SliderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
