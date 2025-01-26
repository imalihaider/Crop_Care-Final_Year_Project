import 'package:flutter/material.dart';
import 'package:plantdetectionfyp/ui/screens/Planner.dart';
import 'package:weather/weather.dart';
import 'package:plantdetectionfyp/constants.dart';
import 'package:plantdetectionfyp/models/plants.dart';



enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class Weatherforecast extends StatefulWidget {
  const Weatherforecast({Key? key}) : super(key: key);

  @override
  State<Weatherforecast> createState() => _WeatherforecastState();
}

class _WeatherforecastState extends State<Weatherforecast> {
  List<Plant> myCart = [];
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  late WeatherFactory ws;
  List<Weather> _data = [];
  AppState _state = AppState.NOT_DOWNLOADED;
  double? lat, lon;

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
  }

  void queryForecast() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    List<Weather> forecasts = await ws.fiveDayForecastByLocation(lat!, lon!);
    setState(() {
      _data = forecasts;
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  void queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByLocation(lat!, lon!);
    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                "Place Name           " +
                    _data[index].areaName.toString() +
                    "\n" +
                    "Temperature          " +
                    _data[index].temperature.toString() +
                    "\n" +
                    "Region                    " +
                    _data[index].country.toString() +
                    "\n" +
                    "Date                        " +
                    _data[index].date.toString() +
                    "\n" +
                    "Wind Speed           " +
                    _data[index].windSpeed.toString(),
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.transparent,
          );
        },
      ),
    );
  }

  Widget contentDownloading() {
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(children: [
        Text(
          'Fetching Weather...',
          style: TextStyle(fontSize: 20),
        ),
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(
                child: CircularProgressIndicator(
                    strokeWidth: 10,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Constants.primaryColor))))
      ]),
    );
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press the button to download the Weather forecast',
          ),
        ],
      ),
    );
  }

  Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
      ? contentDownloading()
      : contentNotDownloaded();

  void _saveLat(String input) {
    lat = double.tryParse(input);
    print(lat);
  }

  void _saveLon(String input) {
    lon = double.tryParse(input);
    print(lon);
  }

  Widget _coordinateInputs() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.only(bottom: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), //border corner radius
        boxShadow: [
          BoxShadow(
            color: Constants.primaryColor, //color of shadow
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 26),
                  child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF00E676),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: " Latitude",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: _saveLat,
                      onSubmitted: _saveLat),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                  child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF00E676),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: " Longitude",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: _saveLon,
                      onSubmitted: _saveLon),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Constants.primaryColor,
                    minimumSize: const Size(125, 50)),
                onPressed: queryWeather,
                child: const Text(
                  "Fetch Weather",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: queryForecast,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Constants.primaryColor,
                  minimumSize: const Size(125, 50),
                ),
                child: const Text(
                  "Fetch Forecast",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // Widget _buttons() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         margin: EdgeInsets.all(5),
  //         child: TextButton(
  //           child: Text(
  //             'Fetch weather',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           onPressed: queryWeather,
  //           style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all(Color(0xff296e48))),
  //         ),
  //       ),
  //       Container(
  //         margin: EdgeInsets.all(5),
  //         child: TextButton(
  //           child: Text(
  //             'Fetch forecast',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           onPressed: queryForecast,
  //           style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all(Color(0xff296e48))),
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather',
          style: TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => Planner(
              //
              //       ),
              //     ));
            },
            icon: const Icon(Icons.shopping_cart),
            color: Constants.blackColor,
          )
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            _coordinateInputs(),
            // Text(
            //   'Output:',
            //   style: TextStyle(fontSize: 20),
            // ),
            const Divider(
              height: 18.0,
              thickness: 2.0,
            ),
            const SizedBox(
              height: 18,
            ),

            Expanded(
              child: _resultView(),
            )
          ],
        ),
      ),
    );
  }
}
