import 'package:flutter/material.dart';
import 'package:store_app/view/screens/cart/cart_content.dart';
import 'package:store_app/view/screens/home/products_screen.dart';
import 'package:store_app/view/screens/products/product_details.dart';
import 'package:store_app/view/screens/profile/profile_screen.dart';
import 'package:store_app/view/screens/start/splash_screen.dart';

class RoutesManger {
  static const initialRoute =SplashScreen.pageRoute;
  static final Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.pageRoute:(context)=>const SplashScreen(),
    CartScreen.pageRoute:(context)=>const CartScreen(),
    ProductsScreen.pageRoute:(context)=>const ProductsScreen(),
    ProductDetailsScreen.pageRoute:(context)=>const ProductDetailsScreen(),
    ProfileScreen.pageRoute:(context)=>const ProfileScreen(),
  };
}
