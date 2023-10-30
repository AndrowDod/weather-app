import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constes.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/servies/weather_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    String cityName;
    final double theheight = MediaQuery.of(context).size.height;
    final double thewidth = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();

    getWeather() async {
      cityName = controller.text;

      WeatherService service = WeatherService();

      WeatherModel weather = await service.getWeather(cityName: cityName);

      // ignore: use_build_context_synchronously
      Provider.of<WeatherProvider>(context, listen: false).weatherData =
          weather;
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: theheight * 0.2),
            Padding(
              padding: EdgeInsets.only(
                  left: thewidth * 0.03,
                  right: thewidth * 0.03,
                  bottom: theheight * 0.03),
              child: Text(
                "Enter name of city",
                style: TextStyle(
                  fontSize: theheight * 0.03,
                  color: mainColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: thewidth * 0.03, right: thewidth * 0.03),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text("Search"),
                  hintText: "Enter city",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: theheight * 0.07),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.text.isNotEmpty) {
                    getWeather().then((value) => Navigator.pop(context));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          height: theheight * 0.3,
                          width: thewidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Please enter city",
                              style: TextStyle(
                                fontSize: theheight * 0.03,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: theheight * 0.02,
                    color: mainColor,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
