import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday_mall/helper/route_helper.dart';
import 'package:sunday_mall/utils/app_colors.dart';
import '../../controllers/productdetailscontroller/productdetails.dart';
import '../../widgets/button/gradient_button.dart';
import '../../widgets/button/social_login_button.dart';
import '../../widgets/product/ShippingInfoSection.dart';
import '../../widgets/product/another_product_section.dart';
import '../../widgets/product/customer_reviews_section.dart';
import '../../widgets/product/rating_and_review_section.dart';
import '../../widgets/product/selectsizeselection.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailController controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Headphones', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Container(
                width: size.width,
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Image.asset(
                          'assets/featured_products_images/productimages.png',
                          height: 200,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            child: const Icon(Icons.favorite_border, color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('FLAT 30% OFF', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  Spacer(),
                  Icon(Icons.star, color: Colors.blue),
                  SizedBox(width: 4),
                  Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Text('32 Ratings', style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(height: 10),
              Text('\$349.99', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('SONY Premium Wireless Headphones', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text('Model: WH-1000XM4, Black', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),
              Row(
                children: [
                  tabItem('Overview', 0),
                  tabItem('Features', 1),
                  tabItem('Specification', 2),
                ],
              ),
              SizedBox(height: 12),
              Obx(() {
                if (controller.selectedTab.value == 0) {
                  return GestureDetector(
                    onTap: controller.toggleShowMore,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: controller.showMore.value
                                ? controller.description
                                : controller.description.substring(0, 200) + '...',
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: controller.showMore.value ? ' Show Less' : ' Show More',
                            style: TextStyle(color: AppColors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (controller.selectedTab.value == 1) {
                  return Text('Features will be listed here.');
                } else {
                  return Text('Specifications will be shown here.');
                }
              }),
              SizedBox(height: 20),
              SelectSizeSection(),
              SizedBox(height: 20),
              ShippingInfoSection(),
              SizedBox(height: 20),
              RatingAndReviewSection(),
              SizedBox(height: 20),
              CustomerReviewsSection(),
              SizedBox(height: 20),
              AnotherProductSection(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: GradientButton(
                text: 'Buy Now',
                onPressed: () {},
                borderRadius: 30,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SocialLoginButton(
                label: 'Add To Bag',
                onTap: () {
                  Get.toNamed(RouteHelper.getShoppingCartScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabItem(String title, int index) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Obx(() => Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: controller.selectedTab.value == index ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      )),
    );
  }
}
