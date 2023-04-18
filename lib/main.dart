import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/provider/slider_provider.dart';
import 'package:state_management/provider/switch_provider.dart';
import 'package:state_management/provider/themechange_provider.dart';
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
        ChangeNotifierProvider<FavouriteProvider>(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider<ThemeChangerProvider>(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider<SwitchProvider>(create: (_) => SwitchProvider()),
      ],
      child: Builder(
        builder: (BuildContext context){
          final themeProvider = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.green,
                appBarTheme: const AppBarTheme(
                backgroundColor: Colors.green,
            )
            ),
            home: const HomeScreen(),
          );
        }

      ),
    );
  }
}
