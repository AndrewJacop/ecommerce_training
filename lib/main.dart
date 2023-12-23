import 'package:ecommerce_training/core/controllers/cart_controller/cart_cubit.dart';
import 'package:ecommerce_training/core/controllers/favourite_controller/favourite_cubit.dart';
import 'package:ecommerce_training/core/controllers/login_controller/login_cubit.dart';
import 'package:ecommerce_training/core/controllers/observer.dart';
import 'package:ecommerce_training/core/controllers/onboarding_controller/onboarding_cubit.dart';
import 'package:ecommerce_training/core/controllers/product_controller/product_cubit.dart';
import 'package:ecommerce_training/core/controllers/profile_controller/profile_cubit.dart';
import 'package:ecommerce_training/core/controllers/register_controller/register_cubit.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/local/cache_helper.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/core/themes/themes.dart';
import 'package:ecommerce_training/screens/modules/home.dart';
import 'package:ecommerce_training/screens/modules/login.dart';
import 'package:ecommerce_training/screens/modules/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // Force running only after finishing all awaited functions
  WidgetsFlutterBinding.ensureInitialized();
  // initializing the network helpers
  DioHelperStore.init();
  await CacheHelper.init();
  // setting the value of boarding bool
  /// doneBoarding = CacheHelper.getData(key: 'Boarding') ?? false;
  /// token = CacheHelper.getData(key: "token") ?? "";
  /// nationalId = CacheHelper.getData(key: "userId") ?? "";
  doneBoarding = true;
  token = "p26uldmewrplq5cx6zm";
  nationalId = "30202060101742";
  // setting the nextScreen value
  nextScreen = doneBoarding
      ? (token != "" ? const HomeScreen() : const LoginScreen())
      : const OnboardingScreen();

  /// print(token);
  /// print(nationalId);
  // adjusting notification bar icons and its colorsX
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  // testing out the bloc cubit
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

  /// WidgetsFlutterBinding.ensureInitialized();
  /// DioHelperStore.init();
  /// await CacheHelper.init();
  /// var boarding = CacheHelper.getData(key: 'Boarding');
  /// token = CacheHelper.getData(key: 'token');
  /// nationalId = CacheHelper.getData(key: 'userId');
  /// print(token);
  /// print(nationalId);
  /// print(boarding);
  /// if (boarding == true) {
  ///   if (token != null) {
  ///     nextScreen = const HomeScreen();
  ///   } else {
  ///     nextScreen = const RegisterScreen();
  ///   }
  /// } else {
  ///   nextScreen = const OnboardingScreen();
  /// }
  /// SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  ///   statusBarColor: Colors.transparent,
  ///   statusBarIconBrightness: Brightness.dark,
  /// ));
  /// Bloc.observer = MyBlocObserver();
  /// runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ProductCubit()..getHomeProducts(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CartCubit()..getCart(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getUserData(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => FavouriteCubit()..getFavorite(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: lightTheme,
        home: nextScreen,
      ),
    );
  }
}
