import 'package:flutter/material.dart';
import 'package:untitled/components/app_bar.dart';
import 'package:untitled/components/app_color.dart';
import 'package:untitled/components/app_constant.dart';
import 'package:untitled/components/custom_elevated_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int isDelivered = 1;
  final List<String> orderTypes = ['Deliver', 'Pick up'];

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Order',
        wantLeading: true,
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        leadingWidget: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 70,
      ),
      backgroundColor: Color(0xfff9f9f9),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).height * 0.03,
          vertical: MediaQuery.sizeOf(context).width * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //wipe wipe order
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelect = isDelivered == index;
                  return build_order1(index, isSelect);
                },
                separatorBuilder: (context, index) => SizedBox(width: 5),
                itemCount: 2,
              ),
            ),

            //Address Details
            build_address(),
            Divider(color: Colors.grey, thickness: 2),

            //adding Items
            build_add_items(),
            SizedBox(height: 5,),
            Divider(color: Color(0xffF9F2ED),thickness: 5,),
            //discount popup

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
              decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12)
              ),
              child:Row(
                children: [
                  Icon(Icons.ac_unit,size: 12,color: Appcolors.orange,),
                  SizedBox(width: 7,),
                  Text('1 Discount is Applies',style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,
                  ),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,)
                ],
              ),
            )

            //payment summary
            Widget build_payment()

          ],
        ),
      ),

      // first Deliver/Pick up
    );
  }

  Widget build_order1(final int index, bool isSelect) {
    return InkWell(
      onTap: () {
        setState(() {
          isDelivered = index;
        });
      },
      child: Expanded(
        child: Container(
          width: MediaQuery.sizeOf(context).width / 2.6,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isSelect ? Appcolors.orange : Color(0xffEDEDED),
          ),
          child: Text(
            orderTypes[index],
            style: TextStyle(
              color: isSelect ? Colors.white : Appcolors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget build_address() {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Delivery Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          SizedBox(height: 10),
          Text(
            'St.Yantra Ram',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
          ),
          Text(
            '12, Nehru Street, 45354',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Appcolors.grey,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              custom_elevated_button(
                // width: 100,
                height: 35,
                borderRadius: 25,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                text: 'Edit Address',
                borderColor: Colors.black26,
                fontWeight: FontWeight.w500,
                // onPressed: () {},
                suffixIcon: Icon(Icons.edit),
              ),
              SizedBox(width: 10),
              custom_elevated_button(
                height: 35,
                // width: 1,
                text: 'Add Note',
                backgroundColor: Colors.white,
                borderColor: Colors.black26,
                foregroundColor: Colors.black,
                bgColor: Colors.white,
                borderRadius: 25,
                fontWeight: FontWeight.w500,
                // onPressed: () {},
                suffixIcon: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build_add_items() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppConstants.cafe,
                fit: BoxFit.cover,
                width: 65,
                height: 65,
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text(
                  'Coffa Mocha',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Deep Foam',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),

        // Add button
        quantity == 0
            ? InkWell(
                onTap: () {
                  setState(() {
                    quantity = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Appcolors.orange,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add, size: 20, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.remove, size: 16, color: Colors.black),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                ''
                                'You can buy minimum 1 product',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget build_payment() {
    return Column(
      children: [
        Text('Payment Summary',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
        SizedBox(height: 8,),
        Row(
          children: [
            Text('Price',style: TextStyle(
              fontSize: 14
            ),),
            Text('\$4.56',style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold
            ),),
          ],
        ),    Row(
          children: [
            Text('Discount',style: TextStyle(
              fontSize: 14
            ),),
            Spacer(),
            Text('\$4.56',style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold,
            ),), Text('\$4.56',style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ],
    );
  }
}
