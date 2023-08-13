import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_test/screens/weather/model.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {

  final cityController = TextEditingController(text: "mansoura");

  bool isLoading = false;
  WeatherData? model;
  getData()
  async {
    isLoading = true;
    setState(() {});

    final response = await Dio().get("https://api.openweathermap.org/data/2.5/weather?q=${cityController.text}&appid=509dc5d730ff2dd6003b22f30ae93313");
    print(response.data);
    model = WeatherData.fromJson(response.data);

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Weather App"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(controller: cityController,),
            SizedBox(height: 18,),
            ElevatedButton(onPressed: ()
            {
              getData();
            },
                child: Text("Find"),
            ),
            isLoading? CircularProgressIndicator() : model!=null? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(model!.main.temp.toString()),
                Text(model!.name),
              ],
            ): SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
