import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemperatureInput extends StatelessWidget {
  final TextEditingController controller;

  const TemperatureInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Masukkan suhu (Celcius)',
        hintStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
