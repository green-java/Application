import 'package:flutter/material.dart';
import 'package:untitled/components/app_color.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final List<Widget>? actions;
  final double? leadingWidth;
  final double? elevation;
  final Widget? leadingWidget;
  final bool wantLeading;
  final bool? centerTitle;
  final Icon? iconSet;
  final double? toolbarHeight;
  final Color? shadowColor;


   customAppBar({super.key,required this.title, this.leadingWidget, this.wantLeading=false, this.iconSet, this.actions, this.leadingWidth, this.elevation,
     this.shadowColor, this.centerTitle, this.toolbarHeight,  });


  @override
  Widget build(BuildContext context) {

    return AppBar(
      centerTitle: centerTitle,
        toolbarHeight: toolbarHeight ,
        surfaceTintColor: Appcolors.yellow,
        backgroundColor: Appcolors.white,
        automaticallyImplyLeading: wantLeading,
        title:  Text(title,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),
        leadingWidth: leadingWidth,
        elevation:elevation,
        shadowColor:shadowColor ,
        leading: leadingWidget,
        actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight+20);
}

