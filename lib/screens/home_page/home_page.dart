import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app_route/route_name.dart';
import 'package:untitled/components/app_color.dart';
import 'package:untitled/components/app_constant.dart';
import 'package:untitled/screens/start_page/start_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_list_view/flutter_list_view.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}
class CafeModel {
  final String imageAs;
  final String title;
  final String subtitle;
  final String price;

  CafeModel( {required this.imageAs, required this.title, required this.subtitle, required this.price});

}
class _homePageState extends State<homePage> {
  int selectedIndex = 0;
  int quantity =0;  // assigned for testing
  var dropdownvalue = 'change_location';
  TextEditingController search_controller = TextEditingController();

  final urlImages = ['assets/images/coffee.png', 'assets/images/banner.png'];
  final cafeItem = ['All Coffee', 'capacino', 'Machiato', 'Latte', 'America'];

  List<CafeModel?> items = [
    CafeModel(imageAs: 'assets/images/cafe.png', title: 'Cafe Mocha', subtitle: 'Deep Foam', price:'4.56'),
    CafeModel(imageAs: 'assets/images/cafe.png', title: 'Cafe Mocha', subtitle: 'Deep Foam', price:'4.56'),
    CafeModel(imageAs: 'assets/images/cafe.png', title: 'Cafe Mocha', subtitle: 'Deep Foam', price:'4.56'),
    CafeModel(imageAs: 'assets/images/cafe.png', title: 'Flat White', subtitle: 'Expresso', price:'5.51')
  ];

  @override
  Widget build(BuildContext context) {
    final blackHeight = MediaQuery.sizeOf(context).height * 0.3;
    var carouselHeight = 200.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: blackHeight,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                  color: Appcolors.lightBlack,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      build_location(),

                      //search bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 6,
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: Appcolors.lightWhite
                              ),
                              controller: search_controller,
                              textInputAction: TextInputAction.search,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white60,
                                ),
                                labelStyle: TextStyle(color: Colors.white60),
                                isDense: true,
                                hintText: 'Search Coffee',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                filled: true,
                                fillColor: Appcolors.veryLightBlack,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Appcolors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.menu_open, size: 28),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //banner
                Positioned(
                  top: blackHeight - (carouselHeight / 2),
                  left: 0,
                  right: 0,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: carouselHeight,
                      autoPlay: true,
                      reverse: true,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                    itemCount: urlImages.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                          final urlImage = urlImages[index];
                          return buildImage(urlImage, index);
                        },
                  ),
                ),
              ],
            ),
            SizedBox(height: carouselHeight / 2),

            //cafe menu
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 8),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 15);
                },
                scrollDirection: Axis.horizontal,
                itemCount: cafeItem.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Center(
                      child: Container(
                        height: 35,
                       padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected
                              ? Appcolors.orange
                              : Color(0xFFF5F5F5),
                        ),
                        child: Text(
                          cafeItem[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected
                                ? Appcolors.white
                                : Appcolors.lightBlack,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //purchase items showcase
            Container(
              height: MediaQuery.sizeOf(context).height,
              // padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 2,
                      // crossAxisSpacing: 2,
                      crossAxisCount: 2),

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,

                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index)
                  {
                     return build_cafe(item: items[index]);
                  }
              ),
              // child: ListView.separated(
              //   separatorBuilder: (context, index) => SizedBox(width: 8),
              //   itemCount: 2,
              //   itemBuilder: (context, index) => build_cafe(item: items[index]),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_location() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location', style: TextStyle(color: Appcolors.grey, fontSize: 16)),

        DropdownButtonHideUnderline(
          child: DropdownButton<String?>(
            elevation: 0,
            dropdownColor: Colors.transparent,
            value: dropdownvalue,
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              color: Appcolors.orange,
              size: 20,
            ),
            items: [
              DropdownMenuItem(
                value: 'change_location',
                child: Text(
                  'change Location',
                  style: TextStyle(color: Appcolors.white),
                ),
              ),
            ],
            onChanged: (String? value) {
              if (value == null) {
                dropdownvalue = 'Set your location';
                return;
              }
              setState(() {
                dropdownvalue = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        width: double.infinity,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.red,width: 5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(urlImage, fit: BoxFit.fill),
      ),
    );
  }


  // purchase cafe container
  Widget build_cafe({required CafeModel? item}) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.itemDetails);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        decoration: BoxDecoration(
          color: Appcolors.lightWhite,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                        child: AspectRatio(aspectRatio: 1,
                        child: Image.asset(item!.imageAs,fit: BoxFit.cover,alignment: Alignment.center,)),),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,size: 12,color: Appcolors.yellow),
                          SizedBox(width: 5,),
                          Text('4.5',style: TextStyle(fontSize: 12,fontWeight:FontWeight.bold,color: Colors.white),)
                        ],
                      ),
                    )),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Text(item!.title,style: TextStyle(fontSize: 20,color: Appcolors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 6,),
                Text(item.subtitle,style: TextStyle(fontSize: 15,color: Appcolors.black),),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(item.price,style: TextStyle(fontSize: 18,color: Appcolors.black,fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          quantity++;
                        });

                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Appcolors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(3.0))
                        ),
                        child: Icon(Icons.add,size: 15,color: Colors.white,),
                      ) ,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


