import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunday_mall/utils/app_colors.dart';
import 'package:sunday_mall/widgets/button/gradient_button.dart';
import 'package:sunday_mall/widgets/button/social_login_button.dart';

import '../../widgets/textfields/custom_dropdown_field.dart';

class Reviewsubmitcancellation extends StatelessWidget {
  const Reviewsubmitcancellation({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String? selectedReason;
    return Scaffold(
      // debugShowCheckedModeBanner: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              Text(
                'Review & submit cancellation',
                style: GoogleFonts.poppins(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.01),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Purchase Date: ",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.black)),
                      Text("3 may, 2025")
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text("Order Number: ",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.black)),
                      Text("BBY01-807041120631")
                    ],
                  )
                  // Text("Order Number:  BBY01-807041120631", style: GoogleFonts.poppins(fontSize: width * 0.035)),
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding: EdgeInsets.all(width * 0.03),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/headphone.png', width: width * 0.2),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SONY Premium',
                              style: GoogleFonts.poppins(
                                color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.05)),
                          Text('Wireless Headphones\nModel: WH-1000XM4, Blackd...\nQty: 1',
                              style: GoogleFonts.poppins(
                                  fontSize: width * 0.035,
                                  color: Colors.black54)),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: width * 0.04),
                  ],
                ),
              ),
              SizedBox(height: height * 0.025),
              Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Payment Details',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.04)),
                    SizedBox(height: height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Fees',
                            style: GoogleFonts.poppins(fontSize: width * 0.035)),
                        Text('Free',
                            style: GoogleFonts.poppins(fontSize: width * 0.035)),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Amounts',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.035)),
                        Text('\$295',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.035)),
                      ],
                    ),
                    SizedBox(height: height * 0.015),
                    Text("Purchase Date:   3 may, 2025",
                        style: GoogleFonts.poppins(fontSize: width * 0.035)),
                    Text("Order Number:   BBY01-807041120631",
                        style: GoogleFonts.poppins(fontSize: width * 0.035)),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Text('How can we help you today?',
                  style: GoogleFonts.poppins(
                      fontSize: width * 0.04, fontWeight: FontWeight.w500)),
              SizedBox(height: height * 0.01),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'i ordered the wrong item',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide(color: Colors.grey.shade400),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(
              //         horizontal: width * 0.04, vertical: height * 0.02),
              //   ),
              // ),


              DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedReason,
                hint: Text('Select your order issue'),
                items: [
                  'Select your order issue',
                  'Item won’t get to me in time',
                  'The price of this item is too high',
                  'I found a better price elsewhere',
                  'I can’t get to the store to pick up',
                  'I don’t want this item anymore',
                  'i ordered the wrong item',
                  'I already ordered this item',
                  'The item is now unavailable/backordered',
                  'i didn’t place this order',
                  'I have a payment issue'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  selectedReason = newValue;
                  // call setState() if you're in a StatefulWidget
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.02),
                ),
              ),



              SizedBox(height: height * 0.03),
               // Drawer(),
              Container(
                margin: EdgeInsets.only(top: height * 0.02),
                padding: EdgeInsets.all(width * 0.035),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Icon(Icons.info_outline, color: Colors.black87, size: width * 0.05),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(color: Colors.black87, fontSize: width * 0.035),
                          children: [
                            TextSpan(
                              text: 'Heads up! ',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "we’re unable to return the promotional offer you applied to this order so it won’t be eligible to use on future orders",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Text("Cancellation Summary",
                  style: GoogleFonts.poppins(
                      fontSize: width * 0.04, fontWeight: FontWeight.w600)),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Canceled Item", style: GoogleFonts.poppins(fontSize: width * 0.035)),
                  Text("\$279", style: GoogleFonts.poppins(fontSize: width * 0.035)),
                ],
              ),
              SizedBox(height: height * 0.015),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.01, vertical: height * 0.015),
                decoration: BoxDecoration(
                  color: Color(0xFFCCCCCC),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your refund",
                        style: GoogleFonts.poppins(
                            fontSize: width * 0.035, color: Colors.black87)),
                    Text("\$279",
                        style: GoogleFonts.poppins(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
                  SizedBox(height: 10,),
              GradientButton(text: 'Cancel Order',
                  onPressed: (){

                  }),
              SizedBox(height: height * 0.015),
              SocialLoginButton(
                  label: 'Back to Order detail',
                  onTap: (){
                    Get.back();
                  }),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

}

