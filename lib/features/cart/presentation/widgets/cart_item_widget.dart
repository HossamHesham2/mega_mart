import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/core/widget/product_counter.dart';
import 'package:ecommerce_c15_str/features/cart/presentation/widgets/brand_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.imagePath,
    required this.id,
    required this.title,
    required this.brandName,
    required this.size,
    required this.price,
    required this.onDeleteTap,
    required this.quantity,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });

  final String imagePath;
  final String id;
  final String title;
  final String brandName;
  final int size;
  final int price;
  final void Function() onDeleteTap;
  final int quantity;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.productDetails,
        arguments: {"id": id},
      ),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: ColorManager.primary.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            // display image in the container
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: ColorManager.primary.withValues(alpha: 0.3),
                ),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                ),
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
                imageUrl: imagePath,
              ),
            ),
            // SizedBox(width: 8.w),
            // display details product=========================
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p8.w,
                  vertical: AppPadding.p8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // title and delete button ==
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onDeleteTap,
                          child: Image.asset(
                            IconsAssets.icDelete,
                            color: ColorManager.textColor,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(height: 7.h),
                    const Spacer(),
                    // display color and size===================
                    BrandCartItem(brandName: brandName),
                    const Spacer(),
                    // display price and quantity =================
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'EGP $price',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp,
                            ),
                          ),
                        ),
                        ProductCounter(
                          add: onIncrementTap,
                          productCounter: quantity,
                          remove: onDecrementTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
