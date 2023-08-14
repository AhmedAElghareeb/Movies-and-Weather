import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/screens/movies/cubit.dart';
import 'package:movies_test/screens/weather/cubit.dart';

import 'screens/movies/view.dart';
import 'screens/weather/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesCubit()..getMovies()),
        BlocProvider(create: (context) => WeatherCubit()..getData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.lightBlueAccent,
            )
          ),
        ),
        home: const WeatherView(),
      ),
    );
  }
}
