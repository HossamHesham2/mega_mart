import 'dart:async';
import 'package:ecommerce_c15_str/core/constant/constant_key.dart';
import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/widget/product_card.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    _printToken();
  }

  Future<void> _printToken() async {
    final prefs = await SharedPreferences.getInstance();
    print("Token --> ${prefs.getString(ConstantKey.tokenKey)}");
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(GetCategoriesEvent())
        ..add(GetBrandsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.categoriesRequestState == RequestState.loading) {
            const Center(child: CircularProgressIndicator());
          } else if (state.categoriesRequestState == RequestState.error) {
            const Center(child: Text("Error loading categories"));
          } else if (state.categoriesResponseModel == null) {
            const Center(child: Text("No categories found"));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAdsWidget(
                  adsImages: adsImages,
                  currentIndex: _currentIndex,
                  timer: _timer,
                ),
                Column(
                  children: [
                    CustomSectionBar(
                      sectionName: 'Categories',
                      function: () {},
                    ),

                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryWidget(
                            category:
                                state.categoriesResponseModel!.data[index],
                          );
                        },
                        itemCount:
                            state.categoriesResponseModel?.data.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 140.h,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      ),
                    ),
                    CustomSectionBar(sectionName: 'Brands', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomBrandWidget(
                            brand: state.brandsResponseModel!.data[index],
                          );
                        },
                        itemCount: state.brandsResponseModel?.data.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 140.h,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      ),
                    ),
                    CustomSectionBar(
                      sectionName: 'Most Selling Products',
                      function: () {},
                    ),
                    SizedBox(
                      child: SizedBox(
                        height: 360.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const ProductCard(
                              title: "Nike Air Jordon",
                              description:
                                  "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                              rating: 4.5,
                              price: 1100,
                              priceBeforeDiscound: 1500,
                              image: ImageAssets.categoryHomeImage,
                            );
                          },
                          itemCount: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
