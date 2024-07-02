import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Center(
        child: const Text(
          'Chatbot Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
