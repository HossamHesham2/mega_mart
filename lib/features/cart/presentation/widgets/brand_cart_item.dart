import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCartItem extends StatelessWidget {
  const BrandCartItem({
    super.key,
    required this.brandName,
  });

  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Brand : ",
          style: getRegularStyle(
            color: ColorManager.textColor.withValues(alpha: 0.5),
            fontSize: AppSize.s14.sp,
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          brandName,
          style: getRegularStyle(
            color: ColorManager.textColor.withValues(alpha: 0.5),
            fontSize: AppSize.s14.sp,
          ),
        ),
      ],
    );
  }
}
