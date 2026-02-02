import 'package:flutter/material.dart';
import 'package:untitled/components/app_bar.dart';
import 'package:untitled/components/app_color.dart';
import 'package:readmore/readmore.dart';
import 'package:untitled/components/app_constant.dart';
import 'package:untitled/components/custom_elevated_button.dart';
import 'package:untitled/screens/order_page/order_page.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int SelectedIndex = 0;
  bool isFav=false;
  final SizeTitle = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: customAppBar(
        title: 'Detail',
        elevation: 0,
        centerTitle: true,
        leadingWidget: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        leadingWidth: 70,
        toolbarHeight: 80,
        // wantLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(icon: Icon(isFav ? Icons.favorite :
            Icons.favorite_outline, size: 25, color: isFav ? Colors.red : Colors.black),
              onPressed: () {
                  setState(()
                  {
                    isFav=!isFav;
                  });
              },),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: Column(
            children: [
              //image container
              Container(
                width: double.infinity,
                height: 190,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AppConstants.cafeDetail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // detail description
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Caffe Mocha',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      // SizedBox(height: 5,),
                      Text(
                        'Ice/Hot',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Appcolors.yellow, size: 25),
                          SizedBox(width: 2),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '(232)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xfff5f5f5),
                        ),
                        child: Image.asset(AppConstants.bike, fit: BoxFit.cover),
                      ),

                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xfff5f5f5),
                        ),
                        child: Image.asset(AppConstants.bean, fit: BoxFit.cover),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xfff5f5f5),
                        ),
                        child: Image.asset(AppConstants.milk, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.grey),

              //description column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    child: ReadMoreText(
                     'A caffè mocha is a rich, chocolate-infused coffee drink made with espresso, steamed milk, and chocolate syrup or cocoa powder, '
                         'topped with milk foam or whipped cream, creating a sweet, indulgent, and velvety blend of bold coffee and decadent'
                         ' chocolate, served hot or iced',
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read More',
                      trimExpandedText: ' Read Less',

                      style: TextStyle(fontSize: 17, color: Appcolors.grey),

                      moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.orange,
                      ),

                      lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.orange,
                      ),
                    ),
                  ),

                  // Size Container
                  SizedBox(height: 25),
                  Text(
                    'Size',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ListView.separated(
                          shrinkWrap: false,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            bool isSelect = SelectedIndex == index;
                            return build_size(index, isSelect);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar:buildBuyNow(),
    );
  }

  Widget buildBuyNow()
  {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        alignment: Alignment.center,
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.s,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 1,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: 5,),
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 20,
                    color: Appcolors.grey,
                  ),
                ),
                Text(
                  '\$4.53',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Appcolors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
                },
                child: const Text(
                  'Buy Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  
  
  Widget build_size(final int index, bool isSelect) => GestureDetector(
    // final bool isSelect;
    onTap: () {
      setState(() {
        SelectedIndex = index;
      });
    },
    child: Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: isSelect ? Color(0xffF9F2ED) : Appcolors.lightWhite,
        border: Border.all(
          color: isSelect ? Appcolors.orange : Colors.grey.shade400,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          SizeTitle[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: isSelect ? Appcolors.orange : Appcolors.black,
          ),
        ),
      ),
    ),
  );
}

//
// bool isExpanded = false;
//
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// AnimatedSize(
// duration: Duration(milliseconds: 300),
// child: Text(
// longText,
// maxLines: isExpanded ? null : 3,
// overflow: TextOverflow.fade,
// style: TextStyle(fontSize: 17, color: Appcolors.grey),
// ),
// ),
// GestureDetector(
// onTap: () {
// setState(() => isExpanded = !isExpanded);
// },
// child: Text(
// isExpanded ? 'Read Less' : 'Read More',
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.bold,
// color: Appcolors.orange,
// ),
// ),
// )
// ],
// );
