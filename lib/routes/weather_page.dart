import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constes.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    WeatherModel weahterData;
    final double theheight = MediaQuery.of(context).size.height;
    final double thewidth = MediaQuery.of(context).size.width;

    weahterData = Provider.of<WeatherProvider>(context).weatherData!;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: theheight,
          color: mainColor,
          child: Column(
            children: [
              SizedBox(height: theheight * 0.1),

              // city name

              Text(
                weahterData.city,
                style: TextStyle(
                  fontSize: theheight * 0.045,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // update time

              Text(
                'Updated: ${weahterData.date}',
                style: const TextStyle(color: Colors.grey),
              ),

              // image of weather

              SizedBox(height: theheight * 0.07),
              Image.network('http:${weahterData.iconUrl}',
                  scale: thewidth / 1200),

              // avgtemp

              SizedBox(height: theheight * 0.05),
              Text(
                '${weahterData.avgtemp}',
                style: TextStyle(
                  fontSize: theheight * 0.05,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: theheight * 0.05),

              // weather condition
              Text(weahterData.condition,
                  style: TextStyle(
                    fontSize: theheight * 0.035,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 209, 205, 205),
                  )),
              SizedBox(height: theheight * 0.05),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: thewidth * 0.12, right: thewidth * 0.12),
                    child: Text(
                      'max : ${weahterData.maxtemp}',
                      style: TextStyle(
                        fontSize: theheight * 0.025,
                        color: const Color.fromARGB(255, 209, 205, 205),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: thewidth * 0.12, right: thewidth * 0.12),
                    child: Text(
                      'min : ${weahterData.maintemp}',
                      style: TextStyle(
                        fontSize: theheight * 0.025,
                        color: const Color.fromARGB(255, 209, 205, 205),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
