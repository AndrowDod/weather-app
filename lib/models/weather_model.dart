class WeatherModel {
  String date;
  dynamic avgtemp;
  dynamic maintemp;
  dynamic maxtemp;
  String condition;
  String iconUrl;
  String city;

  WeatherModel({
    required this.date,
    required this.avgtemp,
    required this.condition,
    required this.maintemp,
    required this.maxtemp,
    required this.iconUrl,
    required this.city,
  });

  factory WeatherModel.formjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: data["location"]['localtime'],
      avgtemp: jsonData['avgtemp_c'],
      condition: data['current']['condition']['text'],
      maintemp: jsonData['mintemp_c'],
      maxtemp: jsonData['maxtemp_c'],
      iconUrl: data['current']['condition']['icon'],
      city: data['location']['name'],
    );
  }
}
