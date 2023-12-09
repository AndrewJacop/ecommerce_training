import 'package:ecommerce_training/core/controllers/observer.dart';
import 'package:ecommerce_training/core/controllers/onboarding_cubit/onboarding_cubit.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/local/cache_helper.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/core/themes/themes.dart';
import 'package:ecommerce_training/screens/modules/login.dart';
import 'package:ecommerce_training/screens/modules/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // Force running only after finishing all awaited functions
  WidgetsFlutterBinding.ensureInitialized();
  // initilizing the network helpers
  DioHelperStore.init();
  await CacheHelper.init();
  // setting the value of boarding bool
  boarding = CacheHelper.getData(key: 'Boarding');
  // setting the nextScreen value
  nextScreen = boarding ? const LoginScreen() : const OnboardingScreen();
  // adjusting notification bar icons and its colors
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  // testing out the bloc cubit
  /// Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
          lazy: true,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: nextScreen,
      ),
    );
  }
}
