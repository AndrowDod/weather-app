import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constes.dart';
import 'package:weather_app/routes/weather_page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double theheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('search');
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Column(children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(theheight * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome in weather app ☁️",
                          style: TextStyle(
                              fontSize: theheight * 0.03, color: mainColor),
                        ),
                        SizedBox(height: theheight / 3),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(57, 48, 79, 113)),
                          onPressed: () {
                            Navigator.of(context).pushNamed('search');
                          },
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontSize: theheight * 0.03,
                              color: mainColor,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ])
          : const WeatherPage(),
    );
  }
}
