import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunday_mall/helper/route_helper.dart';
import '../../utils/app_colors.dart';
import '../button/gradient_button.dart';
import 'add_coupons.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.roboto(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              children: [
                _buildDismissibleItem(context, 'item1', 'TMA-2 Comfort Wireless', 'USD 270'),
                _buildDismissibleItem(context, 'item2', 'CO2 - Cable', 'USD 25'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(32)),
                ),
                builder: (context) =>  CouponScreen(),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Apply"),
                  Icon(Icons.keyboard_arrow_up_rounded),
                ],
              ),
            ),
          ),

          // showModalBottomSheet(

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total 2 Items',
                  style: GoogleFonts.roboto(fontSize: screenWidth * 0.04),
                ),
                Text(
                  'USD 295',
                  style: GoogleFonts.roboto(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.015,
            ),
            child: GradientButton(
              text: "Proceed To Checkout",
              onPressed: () {
               Get.toNamed(RouteHelper.getShoppingCartDetailScreen());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDismissibleItem(BuildContext context, String keyStr, String title, String price) {
    return Dismissible(
      key: Key(keyStr),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        color: AppColors.primary,
        child: Image.asset("assets/icons/delete_icon.png", height: 24, width: 24),
      ),
      onDismissed: (direction) {},
      child: CartItem(
        title: title,
        price: price,
        image: 'assets/images/headphone.png',
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  CartItem({required this.title, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: screenWidth * 0.25,
              height: screenWidth * 0.28,
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.5),
                    child: Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: screenWidth * 0.042,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.038,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, size: screenWidth * 0.05),
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.roboto(fontSize: screenWidth * 0.045),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, size: screenWidth * 0.05),
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset("assets/icons/delete_icon.png")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
