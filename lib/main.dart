import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untitled/app_route/route_name.dart';
import 'package:untitled/app_route/route_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.start,
      getPages: AppScreen.routes
    );
  }
}



