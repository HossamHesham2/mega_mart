import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/presentation/bloc/categories_bloc.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p12,
      ),
      child: BlocProvider(
        create: (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
        child: const Row(
          children: [
            CategoriesList(),
            SizedBox(width: AppSize.s16),
            SubCategoriesList(),
          ],
        ),
      ),
    );
  }
}
