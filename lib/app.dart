import 'package:e_commerce/core/router/app_route.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: AppRoute.homeView,
          routes: AppRoute.getApplicationRoute(),
    );
  }
}