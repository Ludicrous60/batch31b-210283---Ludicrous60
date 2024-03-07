

import 'package:e_commerce/auth/presentation/view/login_view.dart';
import 'package:e_commerce/auth/presentation/view/register_view.dart';
import 'package:e_commerce/home/dashboard.dart';
import 'package:e_commerce/home/presentation/view/home_view.dart';
import 'package:e_commerce/home/products.dart';
import 'package:e_commerce/home/profile_view.dart';

class AppRoute {
  //Private Constructor
  AppRoute._();

  static const String registerScreen = '/registerScreen';
  static const String loginScreen = '/loginScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String productScreen = '/productScreen';
  static const String profileView = '/profileView';
  static const String homeView = '/homeView';
  // static const String searchShowScreen = '/searchShowScreen';

  static getApplicationRoute() {
    return {
      registerScreen: (context) => RegisterView(),
      loginScreen: (context) => LoginView(),
      dashboardScreen: (context) => Dashboard_View(),
      productScreen: (context) => Products_View(),
      profileView: (context) => ProfilePageView(),
      homeView: (context) => HomeView(),
      // searchShowScreen: (context) => SearchShowScreen(),
    };
  }
}
