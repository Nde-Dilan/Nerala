import 'package:anki_like_app/configs/themes.dart';
import 'package:anki_like_app/notifiyers/flascards_notifiyer.dart';
import 'package:anki_like_app/notifiyers/statistic_notifier.dart';
import 'package:anki_like_app/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {

   WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  if (kDebugMode) {
    // Log more when in debug mode.
    Logger.root.level = Level.FINE;
  }

  // Subscribe to log messages.
  Logger.root.onRecord.listen((record) {
    final message = '${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}';

    debugPrint(message);
  });

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FlashCardsNotifier()),
    ChangeNotifierProvider(create: (_) => StatsCardsNotifier()),
  ],
  child: const MyApp()));
}

Logger _log = Logger('main.dart');


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      title: 'Flashcards',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: PageView(
        children: const [
          HomePage(),
          
        ],
      ),
    );
  }
}
