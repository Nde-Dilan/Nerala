import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: Center(
        child: const Text(
          'Stories Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
