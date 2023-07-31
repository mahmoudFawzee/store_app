import 'package:flutter/material.dart';
//import 'package:store_app/widgets/product.dart';

class MyCartProduct extends StatefulWidget {
  //const MyCartProduct({ Key? key }) : super(key: key);
  final String myProductName;
  final double myProductPrice;
  final String myProductImage;
  final int id;
  final Function function;
  // ignore: use_key_in_widget_constructors
  const MyCartProduct(
      {required this.myProductName,
      required this.myProductPrice,
      required this.myProductImage,
      required this.id,
      required this.function
      });

  @override
  State<MyCartProduct> createState() => _MyCartProductState();
}

class _MyCartProductState extends State<MyCartProduct> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          //getting ratio of padding based on screen size
          //from top and buttom we get screen height which is close to 680
          //so we get it using (8*100)/680 = 1.1 %
          vertical: screenHeight * .011,
          //getting ratio of padding based on screen size
          //from right and left we get screen width which is close to 410
          //so we get it using (8*100)/410 = 1.9 %
          horizontal: screenWidth * .019,
        ),
        child: Container(
          height: screenHeight * .33,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: productDetails(
                    screenWidth,
                    context,
                    widget.myProductImage,
                    widget.myProductName,
                    widget.myProductPrice),
              ),
              actionsButton(screenWidth, screenHeight, context, widget.id),
            ],
          ),
        ),
      ),
    );
  }

  Row actionsButton(
      double screenWidth, double screenHeight, BuildContext context, int id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        anActionButton(screenWidth, screenHeight, context, 'remove', widget.function),
        const SizedBox(
          width: 10,
        ),
        anActionButton(screenWidth, screenHeight, context, 'buy', () {}),
      ],
    );
  }

  ElevatedButton anActionButton(double screenWidth, double screenHeight,
      BuildContext context, String action, function) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(screenWidth * .45, screenHeight * 0.06),
        ),
        maximumSize: MaterialStateProperty.all(
          Size(screenWidth * .5, screenHeight * 0.06),
        ),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
      ),
      onPressed: function,
      child: Text(
        action,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Row productDetails(double screenWidth, BuildContext context,
      String getProductImage, String getProductName, double getProductPrice) {
    return Row(
      children: [
        productImage(screenWidth, getProductImage),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productName(context, getProductName),
              productPrice(context, getProductPrice)
            ],
          ),
        ),
      ],
    );
  }

  Container productName(BuildContext context, String name) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Center(
        child: Text(
          name ,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
   Container productPrice(BuildContext context, double price) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Center(
        child: Text(
          '$price\$' ,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }

  Padding productImage(double screenWidth, String productImage) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          productImage,
          width: screenWidth * .48,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
