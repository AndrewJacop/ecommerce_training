import 'package:ecommerce_training/core/network/local/cache_helper.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/core/themes/themes.dart';
import 'package:ecommerce_training/screens/modules/onboarding.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
