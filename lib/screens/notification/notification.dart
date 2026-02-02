import 'package:flutter/material.dart';
import 'package:untitled/components/app_bar.dart';
import 'package:get/get.dart';
import 'package:untitled/components/app_color.dart';
import 'package:untitled/components/app_constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List notificationList=[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: customAppBar(
        title: 'Notification',
        elevation: 10,
        leadingWidget: InkWell(
          onTap: ()=> Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
        ),
        toolbarHeight: 80,
        leadingWidth: 50,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications,size: 30,color: Appcolors.yellow,),
          )
        ],
      ),
      body:  notificationList.isEmpty ?
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    child: Image.asset(AppConstants.noNotification,width:150,fit: BoxFit.fill,)),
                Text('Currently Notification is not available!',style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ) : ListView.builder(itemBuilder: (context, index) => SizedBox.shrink(),)
    );
  }
}
