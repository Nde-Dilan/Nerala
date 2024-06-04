import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Color color;
  const MyWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test app bar"),
      ),
      body: Container(
        decoration: BoxDecoration(color: color),
        child: DatePickerDialog(
            firstDate: DateTime.now(),
            lastDate: DateTime(
              2029,
            )),
      ),
    );
  }
}
