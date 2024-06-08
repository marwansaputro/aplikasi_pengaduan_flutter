import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/body_beranda.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:pusher_beams/pusher_beams.dart';

class ScreenBeranda extends StatelessWidget {
  const ScreenBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    PusherBeams.instance
        .onMessageReceivedInTheForeground((data) => print("object: ${data}"));

    return const Scaffold(
      backgroundColor: darkblue,
      body: BodyBeranda(),
    );
  }
}
