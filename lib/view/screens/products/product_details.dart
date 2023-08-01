import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static String pageRoute = 'product_details_page';
  static int _numberOfOrders = 0;
  @override
  Widget build(BuildContext context) {
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
          '',
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
                '',
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
                        productNameWidget(
                          context,
                          name: '',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        productRating(),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                    endIndent: screenWidth * .1,
                    indent: screenWidth * .1,
                  ),
                  productHint(context),
                  customerNumberOfOrders(),
                  Expanded(
                    child: Row(
                      children: [productPrice(context), addToCart()],
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

  Expanded addToCart() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
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

  Expanded productPrice(BuildContext context) {
    return Expanded(
      child: Text(
        "\$ price",
        style: Theme.of(context).textTheme.bodyMedium,
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
              onPressed: () {},
              icon: const Icon(
                Icons.remove_circle,
                size: 20,
              ),
            ),
            Text('$_numberOfOrders'),
            IconButton(
              onPressed: () {},
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

  Expanded productHint(BuildContext context) {
    return Expanded(
      child: Text(
        'hint',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Expanded productRating() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                //here we use for loop to produce filled stars  and border  stars
                //filled stars for number of rating stars
                //total stars  are 5 .
                int nOfStars = 3;
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
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              "(15 Reviews)",
            ),
          ),
        ],
      ),
    );
  }

  Expanded productNameWidget(
    BuildContext context, {
    required String name,
  }) {
    return Expanded(
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
