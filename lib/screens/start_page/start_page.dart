import 'package:flutter/material.dart';
import 'package:untitled/app_route/route_name.dart';
import 'package:untitled/components/app_color.dart';
import 'package:untitled/components/app_constant.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/BNB/bottom_nav_bar.dart';
import '../../components/custom_elevated_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.65,
      
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConstants.coffee),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(child: SizedBox()),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Appcolors.black),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.04,
                    vertical: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Fall in Love with Coffee in Blissful Delight',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Appcolors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                          style: TextStyle(fontSize: 16, color: Appcolors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> BottomNavBar()));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 52),
                          backgroundColor: Appcolors.orange,
                          foregroundColor: Colors.white, // text & icon color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
