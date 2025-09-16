import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final productId = args?["id"]; // safe access

    if (productId == null) {
      debugPrint("⚠️ Product Id is NULL, arguments not passed!");
    } else {
      debugPrint("✅ Product Id --> $productId");
    }
    return BlocProvider(
      create: (context) =>
          getIt<ProductDetailsBloc>()
            ..add(GetProductDetailsEvent(id: productId ?? '')),
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.productDetailsRequestState) {
            case null:
              return const SizedBox.shrink();
            case RequestState.initial:
              return const SizedBox.shrink();
            case RequestState.loading:
              return Container(
                color: ColorManager.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(
                  "❌ Error: ${state.productDetailsFailures?.message ?? "Unknown error"}",
                ),
              );
            case RequestState.success:
              final product = state.productDetailsResponseModel?.data;
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Product Details',
                    style: getMediumStyle(
                      color: ColorManager.appBarTitleColor,
                    ).copyWith(fontSize: 20.sp),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(IconsAssets.icSearch),
                        color: ColorManager.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 50.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductSlider(
                          items: (product?.images ?? [])
                              .map((url) => ProductItem(imageUrl: url))
                              .toList(),
                          initialIndex: 0,
                        ),
                        SizedBox(height: 24.h),
                        ProductLabel(
                          productName: product?.title ?? "Null",
                          productPrice: 'EGP ${product?.price ?? 0}',
                        ),
                        SizedBox(height: 16.h),
                        ProductRating(
                          productBuyers: '3,230',
                          productRating: '${product?.ratingsAverage ?? 0.0}',
                        ),
                        SizedBox(height: 16.h),
                        ProductDescription(
                          productDescription:
                              product?.description ?? "No description for now",
                        ),
                        ProductSize(
                          size: const [35, 38, 39, 40],
                          onSelected: () {},
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Color',
                          style: getMediumStyle(
                            color: ColorManager.appBarTitleColor,
                          ).copyWith(fontSize: 18.sp),
                        ),
                        ProductColor(
                          color: const [
                            Colors.red,
                            Colors.blueAccent,
                            Colors.green,
                            Colors.yellow,
                          ],
                          onSelected: () {},
                        ),
                        SizedBox(height: 48.h),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total price',
                                  style: getMediumStyle(
                                    color: ColorManager.primary.withValues(
                                      alpha: 0.6,
                                    ),
                                  ).copyWith(fontSize: 18.sp),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'EGP 0',
                                  style: getMediumStyle(
                                    color: ColorManager.appBarTitleColor,
                                  ).copyWith(fontSize: 18.sp),
                                ),
                              ],
                            ),
                            SizedBox(width: 33.w),
                            Expanded(
                              child: CustomElevatedButton(
                                label: 'Add to cart',
                                onTap: () {},
                                prefixIcon: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: ColorManager.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
