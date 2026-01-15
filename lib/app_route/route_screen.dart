import 'package:untitled/app_route/route_name.dart';
import 'package:get/get.dart';
import 'package:untitled/components/app_bar.dart';
import 'package:untitled/screens/BNB/bottom_nav_bar.dart';
import 'package:untitled/screens/home_page/home_page.dart';
import 'package:untitled/screens/item_detail_page/item_detail_page.dart';
import '../screens/start_page/start_page.dart';

class AppScreen {
  static final routes = [
    GetPage(name: Routes.start, page: () => StartPage()),
    GetPage(name: Routes.home, page: () => homePage()),
    GetPage(name: Routes.BNB, page: ()=>BottomNavBar()),
    GetPage(name: Routes.itemDetails, page: ()=>ItemDetailPage())
  ];
}
