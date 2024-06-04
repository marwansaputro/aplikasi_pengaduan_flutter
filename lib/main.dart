import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/const_pusher.dart';
import 'package:integra_mobile/firebase_options.dart';
import 'package:integra_mobile/widget/onboarding/screen_onboarding.dart';
import 'package:pusher_beams/pusher_beams.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PusherBeams.instance.start(instanceId);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integra Mobile New',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        // useMaterial3: true,
      ),
      home: ScreenOnboarding(),
    );
  }
}
