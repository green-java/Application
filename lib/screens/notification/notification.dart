import 'package:flutter/material.dart';
import 'package:untitled/components/app_bar.dart';
import 'package:untitled/components/app_color.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Cafe Note',leadingWidget: Icon(Icons.notifications,size: 20,color:Appcolors.yellow,),),
      body: Container(
      ),
    );
  }
}
