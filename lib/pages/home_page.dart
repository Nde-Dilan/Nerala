import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/components/home_page/topic_tile.dart';
import 'package:anki_like_app/configs/constants.dart';
import 'package:anki_like_app/data/words.dart';
import 'package:anki_like_app/configs/styles/palette.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _topics = [];

  @override
  void initState() {
    for (var word in words) {
      if (!_topics.contains(word.topic)) {
        _topics.add(word.topic);
      }
      _topics.sort();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Palette palette = Palette();

    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;
    const borderRadius = 30.0;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: palette.green,
          toolbarHeight: size.height * .15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.09999,
                  child: Image.asset("assets/buttons/Settings.png")),
              const FadeInAnimation(
                duration: 800,
                child: Text(
                  "Nerala Flascards \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Ink Free"),
                ),
              ),
              SizedBox(
                  width: size.width * iconPadding,
                  child: Image.asset("assets/buttons/Review.png")),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius)))),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: palette.trueWhite,
              expandedHeight: size.height * .40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.1),
                  child: const FadeInAnimation(
                    duration: 1500,
                    child: Image(
                      image: AssetImage("assets/images/Nerala.png"),
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: _topics.length,
                    (context, index) => TopicTile(
                        topic: _topics[index],
                        image: "assets/topics/${_topics[index]}.png")),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16))
          ],
        ),
      ),
    );
  }
}
