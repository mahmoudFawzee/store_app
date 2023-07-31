import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/view/screens/cart/cart_content.dart';
import 'package:store_app/view/screens/products/product_details.dart';
import 'package:store_app/view/screens/start/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: const Color(0xffECECEE),
          actionsIconTheme: const IconThemeData(color: Colors.black, size: 35),
          titleTextStyle: GoogleFonts.sourceCodePro(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hoverColor: Color(0xff000000),
          prefixIconColor: Color(0xff000000),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black, style: BorderStyle.solid, width: 3),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        scaffoldBackgroundColor: const Color(0xffECECEE),
        primaryColor: const Color(0xff1D1C1C),
        colorScheme: const ColorScheme.light(
          secondary: Color(0xffFFFFFF),
        ),
        //primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.neucha(
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
          headline2: GoogleFonts.neucha(),
          headline3: GoogleFonts.neucha(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          headline4: GoogleFonts.neucha(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          headline5: GoogleFonts.neucha(
            textStyle: const TextStyle(color: Colors.black),
          ),
          headline6: GoogleFonts.sourceCodePro(
            textStyle: TextStyle(
              color: Colors.black.withOpacity(.4),
              fontSize: 15,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        ProductDetails.pageRoute: (ctx) => const ProductDetails(),
        Cart.pageRoute: (ctx) => const Cart(),
      },
    );
  }
}
