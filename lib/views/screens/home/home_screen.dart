import 'dart:async';
import 'package:first_project/views/screens/notification_screen.dart';
import 'package:first_project/views/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/homecontroller/home_screen_controller.dart';
import '../../helper/route_helper.dart';
import '../../utils/app_colors.dart';
import '../../widgets/homescreen/add_to_cart.dart';
import '../../widgets/homescreen/best_booking.dart';
import '../../widgets/homescreen/featured_product.dart';
import '../../widgets/homescreen/product_categoris.dart';
import '../../widgets/homescreen/second_serch_widget.dart';
import '../../widgets/homescreen/servicecard.dart';
import '../../widgets/homescreen/top_deals_widget.dart';
import '../../widgets/testimonialswidget.dart';

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

    return Obx(
          () => WillPopScope(
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
          appBar:
          controller.isSearching.value
              ? null
              : PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: SafeArea(
              child: Column(
                children: [
                  // sunday mall logo
                  Center(
                    child: Image.asset(
                      'assets/icons/sunday_mall_logo.png',
                      height: isTablet ? 90 : 70,
                      width: isTablet ? 90 : 70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Drawer icon
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed:
                              () => Scaffold.of(context).openDrawer(),
                        ),

                        Row(
                          children: [
                            // Notification
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                            NotificationPage(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/featured_products_images/home_screen_notification.png",
                                    height: isTablet ? 50 : 40,
                                    width: isTablet ? 50 : 40,
                                  ),
                                ),
                                const Positioned(
                                  right: 4,
                                  top: 4,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            // Cart
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(ShoppingCartScreen());
                                  },
                                  child: Image.asset(
                                    "assets/featured_products_images/home_screen_cart.png",
                                    height: isTablet ? 50 : 40,
                                    width: isTablet ? 50 : 40,
                                  ),
                                ),
                                const Positioned(
                                  right: 4,
                                  top: 4,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.blue,
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.toggleSearch(true),
                              child: Container(
                                height: isTablet ? 60 : 52,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: AppColors.grey,
                                      size: isTablet ? 28 : 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Search here",
                                      style: TextStyle(
                                        fontSize: isTablet ? 18 : 14,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: isTablet ? 60 : 52,
                            width: isTablet ? 60 : 52,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.filter_list,
                                size: isTablet ? 28 : 24,
                              ),
                              onPressed: () {
                                Get.toNamed(
                                  RouteHelper.getSearchFilterScreen(),
                                );
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
                              horizontal: 16.0,
                              vertical: 8,
                            ),
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
                    const SizedBox(height: 20),
                    SecondSerchWidget(),
                    const SizedBox(height: 10),
                    const CategorySection(),
                    const SizedBox(height: 20),
                    TopDealsScreen(),
                    const SizedBox(height: 20),
                    FeaturedSuppliersWidget(),
                    // const SizedBox(height: 20),
                    // const Co2PromoCard(),
                    const SizedBox(height: 10),
                    // const HorizontalProductList(),
                    const SizedBox(height: 20),
                    const ServiceCard(),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFBDD7F0), AppColors.white],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Text(
                              'Best Bookings',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 18 : 16,
                                color: AppColors.black87,
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
                    const SizedBox(height: 20),
                    const DealOfTheDayCard(),
                    const SizedBox(height: 20),
                    // const BestBookingCard(),
                    TestimonialsWidget(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
