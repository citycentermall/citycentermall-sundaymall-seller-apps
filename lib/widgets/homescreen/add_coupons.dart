import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';
import '../textfields/custom_input_field.dart';
import 'coupen_item.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: screenWidth * 0.1,
              height: 4,
              margin: EdgeInsets.only(bottom: screenHeight * 0.02),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          CustomInputField(
            label: '',
            hintText: 'Enter your Coupen Code',
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter your employee ID'
                : null,
            prefixIcon: null,
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            'Your Coupon Codes',
            style: GoogleFonts.manrope(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: const [
                CouponItem(
                  discountBadgeColor: AppColors.primary,
                  buttonTextColor: AppColors.white,
                  buttonColor: AppColors.primary,
                  discount: '10%',
                  offerType: 'Personal offer',
                  code: 'myronocode2020',
                  daysLeft: 6,
                ),
                CouponItem(
                  discountBadgeColor: AppColors.black,
                  buttonTextColor: AppColors.white,
                  buttonColor: AppColors.primary,
                  discount: '10%',
                  offerType: 'Personal offer',
                  code: 'myronocode2020',
                  daysLeft: 6,
                ),
                CouponItem(
                  discountBadgeColor: AppColors.deepPurple,
                  buttonTextColor: AppColors.white,
                  buttonColor: AppColors.primary,
                  discount: '22%',
                  offerType: 'Personal offer',
                  code: 'myronocode2020',
                  daysLeft: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
