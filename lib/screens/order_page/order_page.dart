import 'package:flutter/material.dart';
import 'package:untitled/components/app_bar.dart';
import 'package:untitled/components/app_color.dart';
import 'package:untitled/components/custom_elevated_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int isDelivered = 1;
  final List<String> orderTypes = ['Deliver', 'Pick up'];

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
      backgroundColor: Appcolors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).height * 0.04,
          vertical: MediaQuery.sizeOf(context).width * 0.04,
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
                width: 100,
                height: 40,
                text: 'Edit Address',
                fontWeight: FontWeight.w500,
                onPressed: () {},
                suffixIcon: Icon(Icons.edit),
              ),
              custom_elevated_button(
                height: 40,
                width: 100,
                text: 'Edit Address',
                fontWeight: FontWeight.w500,
                onPressed: () {},
                suffixIcon: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
