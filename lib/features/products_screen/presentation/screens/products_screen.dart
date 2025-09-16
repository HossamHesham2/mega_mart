import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_c15_str/features/products_screen/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_c15_str/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductBloc>()..add(GetProductEvent()),
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.productRequestState == RequestState.loading
              ? Container(
                  color: ColorManager.white,
                  child: Center(child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  )),
                )
              : Scaffold(
                  appBar: const HomeScreenAppBar(
                    automaticallyImplyLeading: true,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount:
                                state.productResponseModel?.data?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 7 / 9,
                                ),
                            itemBuilder: (context, index) {
                              return CustomProductWidget(
                                image:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .imageCover ??
                                    "",
                                title:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .title ??
                                    "",
                                price:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .price ??
                                    0,
                                rating:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .ratingsAverage ??
                                    0.0,
                                discountPercentage:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .priceAfterDiscount ??
                                    0,
                                height: height,
                                width: width,
                                description:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .description ??
                                    "",
                                id:
                                    state
                                        .productResponseModel
                                        ?.data?[index]
                                        .id ??
                                    "",
                              );
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
