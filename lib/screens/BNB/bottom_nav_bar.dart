import 'package:flutter/material.dart';
import 'package:untitled/components/app_color.dart';
import 'package:untitled/screens/home_page/home_page.dart';
import 'package:untitled/screens/item_detail_page/item_detail_page.dart';
import 'package:untitled/screens/notification/notification.dart';
import 'package:untitled/screens/start_page/start_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  int selectedIndex = 0;

  void onTap(int index)
  {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getIndex(int index)
  {
    switch(index)
    {
      case 0:
        return homePage();
      case 1:
        return ItemDetailPage();
      case 2:
        return ItemDetailPage();
      case 3:
        return NotificationPage();
      default:
        return homePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getIndex(selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top:Radius.circular(50)
          ),
          child: SizedBox(
            height: 120,
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                backgroundColor: Appcolors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Appcolors.orange,
                unselectedItemColor: Appcolors.lightWhite,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                onTap: onTap,
                items:[
                  BottomNavigationBarItem(
                  icon: show_icon(
                      index: 0,
                      selectedIcon: Icons.home_filled,),
                    label: 'Home'
                 ),
                  BottomNavigationBarItem(
                  icon: show_icon(
                      index: 1,
                      selectedIcon: Icons.favorite_outlined,),
                    label: 'heart'
                 ),
                  BottomNavigationBarItem(
                  icon: show_icon(
                      index: 2,
                      selectedIcon: Icons.shopping_cart,),
                    label: 'cart'
                 ),
                  BottomNavigationBarItem(
                  icon: show_icon(
                      index: 3,
                      selectedIcon: Icons.notifications,),
                    label: 'notification'
                 ),

                ],
            ),
          ),
        )
    );
  }

  Widget show_icon({required  selectedIcon,required int index}) {
    final isSelect = selectedIndex == index;

     return Container(
       alignment:Alignment.center,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(50),
           topLeft: Radius.circular(50)
           
         )
       ),
       padding: EdgeInsets.all(4),
         child: Column(
             children: [
               isSelect ? Icon(selectedIcon,color: Appcolors.orange,size: 28,) :
               Icon(selectedIcon,color: Appcolors.grey,size: 28,),
               isSelect ? Container(
                 padding: EdgeInsets.only(top: 12),
                 width: 15,
                   height: 7,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: Appcolors.orange,
                   ),
               ) : SizedBox.shrink()
             ],
         ),
     );

  }


}
