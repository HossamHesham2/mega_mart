import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_c15_str/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_c15_str/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>()..add(GetCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.getCartRequestState == RequestState.loading
              ? Container(
                  color: ColorManager.white,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Cart',
                      style: getMediumStyle(
                        fontSize: 20,
                        color: ColorManager.textColor,
                      ),
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage(IconsAssets.icSearch),
                          color: ColorManager.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<CartBloc>(
                            context,
                          ).add(DeleteCartEvent());
                        },
                        icon: ImageIcon(
                          AssetImage(IconsAssets.icDelete),
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  body:
                      (state.getCartResponseEntity?.data?.products == null ||
                          state.getCartResponseEntity!.data!.products!.isEmpty)
                      ? const Center(child: Text("No Products yet"))
                      : Padding(
                          padding: const EdgeInsets.all(AppPadding.p14),
                          child: Column(
                            children: [
                              Expanded(
                                // the list of cart items ===============
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    final product = state
                                        .getCartResponseEntity
                                        ?.data
                                        ?.products?[index]
                                        .product;
                                    return CartItemWidget(
                                      imagePath: product?.imageCover ?? "",
                                      title: product?.title ?? "",
                                      price:
                                          state
                                              .getCartResponseEntity
                                              ?.data
                                              ?.products?[index]
                                              .price
                                              ?.toInt() ??
                                          0,
                                      quantity:
                                          state
                                              .getCartResponseEntity
                                              ?.data
                                              ?.products?[index]
                                              .count
                                              ?.toInt() ??
                                          0,
                                      onDeleteTap: () {},
                                      onDecrementTap: (value) {},
                                      onIncrementTap: (value) {},
                                      size: 40,
                                      brandName: product?.brand?.name ?? "",
                                      id: product?.id ?? "",
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: AppSize.s12.h),
                                  itemCount:
                                      state
                                          .getCartResponseEntity
                                          ?.data
                                          ?.products
                                          ?.length ??
                                      0,
                                ),
                              ),
                              // the total price and checkout button========
                              TotalPriceAndCheckoutBotton(
                                totalPrice:
                                    state
                                        .getCartResponseEntity
                                        ?.data
                                        ?.totalCartPrice
                                        ?.toInt() ??
                                    0,
                                checkoutButtonOnTap: () {},
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                );
        },
      ),
    );
  }
}
