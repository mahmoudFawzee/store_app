import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/view/screens/home/products_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashImage();
  }

  Future splashImage() async {
    await Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ProductsScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images.png'),
            Text(
              'all you want is here',
              style: GoogleFonts.dancingScript(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
