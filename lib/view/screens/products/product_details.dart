import 'package:flutter/material.dart';

import 'package:store_app/view/screens/cart/cart_content.dart';
import 'package:store_app/view/screens/home/products_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static String pageRoute = '/product details';
  static ValueNotifier<Set<ProductInfo>> cartContent = ValueNotifier({});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int numberOfOrders = 0;
  @override
  Widget build(BuildContext context) {
    Map<String, Object> routArges =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    int productId = routArges['id'] as int;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          '${routArges['name']}',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1533038590840-1cde6e668a91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.3)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            //to set the image place
            top: screenHeight * .15 * (1 - .4),
            right: screenWidth * .5 * (1 - .6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                routArges['image'] as String,
                height: screenHeight * .40,
                width: screenWidth * .6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * .35,
              width: screenWidth,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        productNameWidget(routArges, context),
                        const SizedBox(
                          width: 20,
                        ),
                        productRating(productId),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                    endIndent: screenWidth * .1,
                    indent: screenWidth * .1,
                  ),
                  productHint(productId, context),
                  customerNumberOfOrders(),
                  Expanded(
                    child: Row(
                      children: [
                        productPrice(productId, context),
                        addToCart(productId)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded addToCart(int index) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          try {
            ProductDetails.cartContent.value.add(myProducts[index]);
            setState(() {
              ProductsScreen.nOfCartElems.value =
                  ProductDetails.cartContent.value.length;
            });
            SnackBar snackBar = SnackBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              content: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'added to cart successfluy',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              action: SnackBarAction(
                label: 'go to cart',
                textColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Cart.pageRoute);
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            /* showToast(
              'added to cart successfluy',
              position: StyledToastPosition.bottom,
            );*/
          } catch (e) {
            showToast(
              'something went wrong',
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.black,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8),
          child: Text(
            'Cart',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }

  Expanded productPrice(int productId, BuildContext context) {
    return Expanded(
      child: Text(
        "\$${getPrice(productId)}",
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Expanded customerNumberOfOrders() {
    return Expanded(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  numberOfOrders == 0 ? null : numberOfOrders--;
                });
              },
              icon: const Icon(
                Icons.remove_circle,
                size: 20,
              ),
            ),
            Text('$numberOfOrders'),
            IconButton(
              onPressed: () {
                setState(() {
                  numberOfOrders++;
                });
              },
              icon: const Icon(
                Icons.add_circle,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded productHint(int productId, BuildContext context) {
    return Expanded(
      child: Text(
        getHint(productId),
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Expanded productRating(int productId) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (contex, index) {
                //here we use for loop to produce filled stars  and border  stars
                //filled stars for number of rating stars
                //total stars  are 5 .
                int nOfStars = getRating(productId);
                IconData filledStar = Icons.star;
                IconData borderStar = Icons.star_border;
                //max number of rating stars is 5 so we set  max value for i equal 5
                if (index < nOfStars) {
                  return Icon(filledStar);
                }
                return Icon(borderStar);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "(${getNumberOfReviews(productId)} Reviews)",
            ),
          ),
        ],
      ),
    );
  }

  Expanded productNameWidget(
      Map<String, Object> routArges, BuildContext context) {
    return Expanded(
      child: Text(
        routArges['name'] as String,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
