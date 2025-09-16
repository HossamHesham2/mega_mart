import 'package:ecommerce_c15_str/core/resources/assets_manager.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/font_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/presentation/bloc/categories_bloc.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  "Laptops & Electronics",
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  "Laptops & Electronics",
                  ImageAssets.categoryCardImage,
                  goToCategoryProductsListScreen,
                ),
              ),
              // the grid view of the subcategories
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount:
                      state.subCategoriesResponseModel?.data.length ?? 0,
                  (context, index) => SubCategoryItem(
                    state.subCategoriesResponseModel?.data[index].name ?? "",
                    ImageAssets.subcategoryCardImage,
                    goToCategoryProductsListScreen,
                    state.subCategoriesResponseModel?.data[index].id ?? "",
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: AppSize.s8,
                  crossAxisSpacing: AppSize.s8,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void goToCategoryProductsListScreen() {}
}
