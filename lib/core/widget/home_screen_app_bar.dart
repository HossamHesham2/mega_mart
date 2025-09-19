import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/font_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;

  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: SizedBox(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Mega *_",
                style: getSemiBoldStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: AppSize.s24.sp),
              ),
              TextSpan(
                text: "_^ Mart",
                style: getSemiBoldStyle(
                  color: ColorManager.red,
                ).copyWith(fontSize: AppSize.s24.sp),
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(AppSize.s100.w, AppSize.s60.h),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: ColorManager.primary,
                  style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s16.sp,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppMargin.m12.w,
                      vertical: AppMargin.m8.h,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1.w,
                        color: ColorManager.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1.w,
                        color: ColorManager.primary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1.w,
                        color: ColorManager.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1.w,
                        color: ColorManager.primary,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1.w,
                        color: ColorManager.red,
                      ),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: ColorManager.primary,
                    ),
                    hintText: "what do you search for?",
                    hintStyle: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16.sp,
                    ),
                  ),
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Badge(
                    label: state.getCartRequestState == RequestState.loading
                        ? Center(
                            child: SizedBox(
                              height: 5.h,
                              width: 5.w,
                              child: CircularProgressIndicator(
                                color: ColorManager.white,
                                strokeWidth: 2.w,
                              ),
                            ),
                          )
                        : Text(
                            state.getCartResponseModel?.numOfCartItems
                                    .toString() ??
                                "0",
                          ),
                    child: IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.cartRoute),
                      icon: ImageIcon(
                        AssetImage(IconsAssets.icCart),
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
