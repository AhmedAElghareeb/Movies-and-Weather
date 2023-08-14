import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/movies/view.dart';
import 'screens/weather/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.lightBlueAccent,
          )
        ),
      ),
      home: const WeatherView(),
    );
  }
}
