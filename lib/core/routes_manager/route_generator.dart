import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/features/auth/login/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_c15_str/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_c15_str/features/main_layout/main_layout.dart';
import 'package:ecommerce_c15_str/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_c15_str/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return CupertinoPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return CupertinoPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        return CupertinoPageRoute(builder: (_) => const ProductsScreen());

      case Routes.productDetails:
        return CupertinoPageRoute(
          builder: (_) => ProductDetails(),
          settings: settings,
        );

      case Routes.signInRoute:
        return CupertinoPageRoute(builder: (_) => SignInScreen());

      case Routes.signUpRoute:
        return CupertinoPageRoute(builder: (_) => SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
