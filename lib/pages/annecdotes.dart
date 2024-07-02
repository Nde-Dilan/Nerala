import 'package:flutter/material.dart';

class Annecdotes extends StatelessWidget {
  const Annecdotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annecdotes'),
      ),
      body: Center(
        child: const Text(
          'Annecdotes Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
