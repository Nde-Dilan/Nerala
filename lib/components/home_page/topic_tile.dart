import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  final String topic;

  const TopicTile({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
        ),
        // margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(flex: 2, child: Text("Image")),
            Expanded(child: Text(topic)),
          ],
        ));
  }
}
