import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/app/config/app_env.dart';
import 'package:integra_mobile/app/services/helper_local_notifications.dart';
import 'package:integra_mobile/app/services/pusher.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/bloc/bloc_reset_password.dart';
import 'package:integra_mobile/data/repositories/notification_repository.dart';
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
  late final UserRepository userRepository;
  late final PengaduanRepository pengaduanRepository;
  late final NotificationRepository notificationRepository;

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();

    userRepository = UserRepository();
    pengaduanRepository = PengaduanRepository(user: userRepository);
    notificationRepository = NotificationRepository(user: userRepository);
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
          create: (context) => notificationRepository,
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
                    BlocFormLogin(userRepository: userRepository)),
            BlocProvider(
                create: (context) => BlocResetPassword(userRepository)),
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
