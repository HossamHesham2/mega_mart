import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/core/widget/heart_button.dart';
import 'package:ecommerce_c15_str/features/products_screen/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String id;
  final String description;
  final int price;
  final int discountPercentage;
  final double rating;

  const CustomProductWidget({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.productDetails,
        arguments: {"id": id},
      ),
      child: Container(
        width: width * 0.4,

        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withValues(alpha: 0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Not working with the lastest flutter version
                  CachedNetworkImage(
                    imageUrl: image,
                    height: height * 0.15,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Image.network(image, fit: BoxFit.cover),

                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: HeartButton(onTap: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(title),
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      truncateDescription(description),
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.h),

                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP $price",
                            style: getRegularStyle(
                              color: ColorManager.textColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "$discountPercentage %",
                            style: getTextWithLine(),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Review ($rating)",
                                style: getRegularStyle(
                                  color: ColorManager.textColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRateColor,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<ProductBloc>(
                                context,
                              ).add(AddToCartEvent(id: id));
                            },
                            child: Container(
                              height: height * 0.036,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary,
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
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
