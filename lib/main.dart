import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/const_pusher.dart';
import 'package:integra_mobile/firebase_options.dart';
import 'package:integra_mobile/screens/welcome/screen_welcome.dart';
import 'package:integra_mobile/share/network/network.dart';
import 'package:integra_mobile/share/storage/helper_storage.dart';
import 'package:integra_mobile/share/widget/navbar/convex_bottom_bar.dart';
import 'package:integra_mobile/share/widget/onboarding/screen_onboarding.dart';
import 'package:pusher_beams/pusher_beams.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferenceHelper();

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
  late final UserRepository userRepository;
  late final PengaduanRepository pengaduanRepository;

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();

    userRepository = UserRepository();
    pengaduanRepository = PengaduanRepository();
  }

  @override
  void dispose() {
    super.dispose();

    userRepository.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => userRepository,
        ),
        RepositoryProvider(
          create: (context) => pengaduanRepository,
        )
      ],
      child: MultiBlocProvider(
          providers: List.of([
            BlocProvider(
                create: (context) =>
                    AuthenticationBloc(userRepository: userRepository)),
            BlocProvider(
                create: (context) =>
                    FormRegisterBloc(userRepository: userRepository)),
            BlocProvider(
                create: (context) =>
                    BlocFormLogin(userRepository: userRepository))
          ]),
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            title: 'Integra Mobile New',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            ),
            builder: (context, child) {
              return BlocListener<AuthenticationBloc, BlocAuthenticationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        ConvexButtomBar.route(),
                        (route) => false,
                      );
                    case AuthenticationStatus.unauthenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        ScreenWelcome.route(),
                        (route) => false,
                      );
                    case AuthenticationStatus.unknown:
                      break;
                  }
                },
                child: child,
              );
            },
            home: SharedPreferenceHelper.instance.token.toString().isNotEmpty
                ? const ConvexButtomBar()
                : ScreenOnboarding(),
          )),
    );
  }
}
