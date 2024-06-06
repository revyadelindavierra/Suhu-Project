import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widget/temperatur_displaynya.dart';
import 'package:flutter_application_1/widget/temperaturinput.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController celciusController = TextEditingController();
  double kelvinResult = 273.15;
  double reamurResult = 0.8;
  String kelvinText = "0";
  String reamurText = "0";
  String validationMessage = "";

  void calculate() {
    if (celciusController.text.isNotEmpty) {
      double c = double.parse(celciusController.text);
      setState(() {
        kelvinResult = 273.15 + c;
        reamurResult = 0.8 * c;
        kelvinText = kelvinResult.toStringAsFixed(0);
        reamurText = reamurResult.toStringAsFixed(0);
        validationMessage = "";
      });
    } else {
      setState(() {
        validationMessage = 'Silahkan masukkan suhu dalam Celcius';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konverter Suhu'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            TemperatureInput(controller: celciusController),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TemperatureDisplay(
                      label: 'Suhu dalam Kelvin',
                      value: kelvinText,
                    ),
                    SizedBox(width: 30),
                    TemperatureDisplay(
                      label: 'Suhu dalam Reamur',
                      value: reamurText,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: calculate,
                child: Text('Konversikan'),
              ),
            ),
            Text(
              validationMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
