import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/configs/styles/palette.dart';
import 'package:anki_like_app/utils/methods.dart';
import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  final String topic;
  final String image;

  const TopicTile({
    super.key,
    required this.topic,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Palette palette = Palette();
    return FadeInAnimation(
      duration: 1000,
      child: InkWell(
        onTap: () {
          loadSession(context: context, topic: topic);
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: palette.green,
            ),
            // margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(tag: topic,
                      child: Image(image: AssetImage(image))),
                    )),
                Expanded(child: Text(topic)),
              ],
            )),
      ),
    );
  }
}
