import 'package:anki_like_app/animations/fade_in_animation.dart';
import 'package:anki_like_app/components/welcome_page/language_selector.dart';
import 'package:anki_like_app/configs/themes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  List<String> availableLanguages = ['Ghomala', 'Fuldé', 'Tupuri'];
  String selectedLanguage = 'Fuldé';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: palette.trueWhite,
        appBar: AppBar(
          title: const Text('Nerala ``'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Let\'s create an acount',
                    style: TextStyle(
                        fontSize: 24 * size.width / 400, color: palette.green),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.1),
                    child: const FadeInAnimation(
                      duration: 1500,
                      child: Image(
                        width: 144,
                        image: AssetImage("assets/images/Nerala.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: Text(
                    "Your Name:",
                    style: TextStyle(color: palette.black),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name!';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 48,
                    child: Text(
                      "What do you want to learn?:",
                      style: TextStyle(color: palette.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LanguageSelector(
                    languages: availableLanguages,
                    selectedLanguage: selectedLanguage,
                    onLanguageChange: (newLanguage) {
                      selectedLanguage = newLanguage;
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                registerButton(context, size, "Register"),
                const SizedBox(
                  height: 18,
                ),
                registerButton(context, size, "Skip →"),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        )));
  }

  TextButton registerButton(BuildContext context, Size size, String text) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: palette.black,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        minimumSize:
            MaterialStateProperty.all<Size?>(Size(303 * size.width / 400, 54)),
        backgroundColor: MaterialStateProperty.all<Color?>(palette.black),
      ),
      onPressed: () async {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 19 * size.width / 400,
              color: palette.trueWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
