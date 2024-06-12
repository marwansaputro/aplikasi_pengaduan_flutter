import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/app/config/app_env.dart';
import 'package:integra_mobile/app/services/helper_local_notifications.dart';
import 'package:integra_mobile/app/services/pusher.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/firebase_options.dart';
import 'package:integra_mobile/screens/welcome/screen_welcome.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/services/helper_storage.dart';
import 'package:integra_mobile/share/widget/navbar/convex_bottom_bar.dart';
import 'package:integra_mobile/share/widget/onboarding/screen_onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferenceHelper();
  await AppEnv().init();

  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    ServicePusherBeams().startUp(),
    NotificationService().init(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthRepository authRepository;
  late final PengaduanRepository pengaduanRepository;
  late final NotificationRepository notificationRepository;
  late final UserRepository userRepository;

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();

    authRepository = AuthRepository();
    pengaduanRepository = PengaduanRepository(user: authRepository);
    notificationRepository = NotificationRepository(user: authRepository);
    userRepository = UserRepository(authRepository: authRepository);
  }

  @override
  void dispose() {
    super.dispose();

    authRepository.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => authRepository),
        RepositoryProvider(create: (context) => notificationRepository),
        RepositoryProvider(create: (context) => pengaduanRepository),
        RepositoryProvider(create: (context) => userRepository)
      ],
      child: MultiBlocProvider(
          providers: List.of([
            BlocProvider(
                create: (context) =>
                    AuthenticationBloc(userRepository: authRepository)),
          ]),
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            title: 'Integra Mobile New',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            ),
            builder: (context, child) {
              return BlocListener<AuthenticationBloc, BlocAuthenticationState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
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
