import 'package:ecommerce_c15_str/core/constant/constant_key.dart';
import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes_manager/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(ConstantKey.tokenKey);
  if (token != null) {
    bool isExpired = JwtDecoder.isExpired(token);
    print("Token expired? $isExpired");

    DateTime expirationDate = JwtDecoder.getExpirationDate(token);
    print("Expires at: $expirationDate");

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded token: $decodedToken");
  } else {
    print("No token saved in SharedPreferences!");
  }

  runApp(
    MainApp(
      startRoute: (token != null && !JwtDecoder.isExpired(token))
          ? Routes.mainRoute
          : Routes.signInRoute,
    ),
  );
}

class MainApp extends StatelessWidget {
  final String startRoute;

  const MainApp({super.key, required this.startRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: startRoute,
      ),
    );
  }
}
