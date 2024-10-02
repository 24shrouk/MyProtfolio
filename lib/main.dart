import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/views/home_view.dart';

void main() {
  runApp(
      DevicePreview(enabled: true, builder: ((context) => const Protfilo())));
}

class Protfilo extends StatelessWidget {
  const Protfilo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
