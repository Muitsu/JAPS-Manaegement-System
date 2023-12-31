import 'package:flutter/material.dart';
import 'package:japs/constants/color_constants.dart';
import 'package:japs/pages/harvesting/harvest_provider.dart';
import 'package:japs/pages/home/home_provider.dart';
import 'package:japs/pages/splash/splash_page.dart';
import 'package:japs/pages/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: ((context) => HomeProvier()),
    ),
    ChangeNotifierProvider(
      create: ((context) => HarvestProvider()),
    ),
    ChangeNotifierProvider(
      create: ((context) => UserProvider()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AssetsColor.primaryColor),
        inputDecorationTheme:
            InputDecorationTheme(hintStyle: TextStyle(color: Colors.grey[500])),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
