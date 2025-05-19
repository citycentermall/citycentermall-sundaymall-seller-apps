import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sunday_mall/helper/route_helper.dart';
import 'package:sunday_mall/widgets/homescreen/product_categoris.dart';
import 'package:sunday_mall/views/screens/search_filter.dart';
import 'package:sunday_mall/views/screens/search_screen.dart';
import 'package:sunday_mall/widgets/homescreen/servicecard.dart';
import '../../controllers/homecontroller/home_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/homescreen/Co2PromoCard.dart';
import '../../widgets/homescreen/HorizontalProductList.dart';
import '../../widgets/homescreen/add_to_cart.dart';
import '../../widgets/homescreen/best_booking.dart';
import '../../widgets/homescreen/best_booking_card.dart';
import '../../widgets/homescreen/featured_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Obx(() => WillPopScope(
      onWillPop: () async {
        if (controller.isSearching.value) {
          controller.toggleSearch(false);
          return false;
        } else {
          SystemNavigator.pop();
          return false;
        }
      },
      child: Scaffold(
        drawer: const Drawer(child: Center(child: Text("Masum Raja"))),
        appBar: controller.isSearching.value
            ? null
            : AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Row(children: [
            Image.asset('assets/icons/sunday_mall_logo.png',
                height: isTablet ? 80 : 60,
                width: isTablet ? 80 : 60),
          ]),
          actions: [
            const SizedBox(width: 20),
            InkWell(
              child: Image.asset(
                "assets/featured_products_images/home_screen_cart.png",
                height: isTablet ? 50 : 40,
                width: isTablet ? 50 : 40,
              ),
              onTap: () {
                Get.to(ShoppingCartScreen());
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.isSearching.value)
                  SearchUI()
                else ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Container(
                          height: isTablet ? 60 : 52,
                          width: isTablet ? 60 : 52,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.filter_list,
                                size: isTablet ? 28 : 24),
                            onPressed: () {
                              Get.toNamed(RouteHelper.getSearchFilterScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isTablet ? 220 : 180,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.sliderImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              controller.sliderImages[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const CategorySection(),
                  const FeaturedProductsSection(),
                  const SizedBox(height: 20),
                  const Co2PromoCard(),
                  const SizedBox(height: 10),
                  const HorizontalProductList(),
                  const SizedBox(height: 20),
                  const ServiceCard(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFBDD7F0), AppColors.white],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                        const Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
