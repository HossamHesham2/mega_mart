import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  final Brand brand;

  const CustomBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          height: 80.h,
          width: 80.w,
          fit: BoxFit.cover,
          imageUrl: brand.image,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),

      ],
    );
  }
}

// CachedNetworkImage(
//   height: 80,
//   width: 80,
//   fit: BoxFit.cover,
//   imageUrl: ImageAssets.categoryHomeImage,
//   placeholder: (context, url) =>
//       const Center(child: CircularProgressIndicator()),
//   errorWidget: (context, url, error) =>
//       const Center(child: Icon(Icons.error)),
//   imageBuilder: (context, imageProvider) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//           image: imageProvider,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   },
// ),
