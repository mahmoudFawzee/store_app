import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/the_cart_product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const pageRoute = 'cart_page';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear_all_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: ((context, index) => MyCartProduct(
            myProductName: 'name',
            myProductPrice: 20.0,
            myProductImage: 'img',
            id: 1,
            function: () {})),
      ),
    );
  }
}
