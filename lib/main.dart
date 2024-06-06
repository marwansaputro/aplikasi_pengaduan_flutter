import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/const_pusher.dart';
import 'package:integra_mobile/firebase_options.dart';
import 'package:integra_mobile/widget/onboarding/screen_onboarding.dart';
import 'package:pusher_beams/pusher_beams.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Future.wait([
    dotenv.load(fileName: ".env"),
    PusherBeams.instance.start(instanceId),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: List.of([
          BlocProvider(
            create: (context) => AuthenticationBloc(BlocAuthenticationState()),
          ),
          BlocProvider(
            create: (context) =>
                FormRegisterBloc(const FormRegisterBlocState()),
          )
        ]),
        child: MaterialApp(
          title: 'Integra Mobile New',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            // useMaterial3: true,
          ),
          home: ScreenOnboarding(),
        ));
  }
}
