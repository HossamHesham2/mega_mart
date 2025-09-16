import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/presentation/bloc/categories_bloc.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.categoriesRequestState == RequestState.loading) {
          const Center(child: CircularProgressIndicator());
        }
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withValues(alpha: 0.3),
                ),
                left: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withValues(alpha: 0.3),
                ),
                bottom: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withValues(alpha: 0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
            ),

            // the categories items list
            child: ClipRRect(
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: ListView.builder(
                itemCount: state.categoriesResponseModel?.data.length ?? 0,
                itemBuilder: (context, index) => CategoryItem(
                  index,
                  state.categoriesResponseModel?.data[index].name ?? "",
                  state.categoriesResponseModel?.data[index].id ?? "",
                  selectedIndex == index,
                  onItemClick,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // callback function to change the selected index
  void onItemClick(int index,id) {
    BlocProvider.of<CategoriesBloc>(
      context,
    ).add(GetSubCategoriesEvent(categoryId: id));
    setState(() {
      selectedIndex = index;
    });
  }
}
