import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constes.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/routes/home_page.dart';
import 'package:weather_app/routes/weather_page.dart';
import 'routes/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        routes: {
          'search': (context) => const SearchPage(),
          'weather': (context) => const WeatherPage(),
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: mainColor),
          primarySwatch: Colors.orange,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
