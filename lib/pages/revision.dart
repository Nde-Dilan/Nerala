import 'package:flutter/material.dart';

class Revision extends StatelessWidget {
  const Revision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revision'),
      ),
      body: Center(
        child: const Text(
          'Revision Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
