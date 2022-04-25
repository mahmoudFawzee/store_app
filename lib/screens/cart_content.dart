import 'package:flutter/material.dart';
import 'package:store_app/app_data/product_info.dart';
import 'package:store_app/screens/product_details.dart';
import 'package:store_app/screens/products_screen.dart';
import 'package:store_app/widgets/the_cart_product.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  static const pageRoute = '/cart';

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
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
              onPressed: () {
                setState(() {
                  ProductDetails.cartContent.value.clear();
                  ProductsScreen.nOfCartElems.value =
                      ProductDetails.cartContent.value.length;
                });
              },
              icon: const Icon(Icons.clear_all_outlined),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: ProductDetails.cartContent,
          builder: (context, value, _) =>
              ProductDetails.cartContent.value.isEmpty
                  ? const Center(
                      child: Text('no items in your cart'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ProductDetails.cartContent.value.length,
                      itemBuilder: ((context, index) => MyCartProduct(
                            myProductName: ProductDetails.cartContent.value
                                .elementAt(index)
                                .productInfo['productName'] as String,
                            myProductPrice: ProductDetails.cartContent.value
                                .elementAt(index)
                                .productInfo['price'] as double,
                            myProductImage: ProductDetails.cartContent.value
                                .elementAt(index)
                                .productInfo['imageUrl'] as String,
                            id: ProductDetails.cartContent.value
                                .elementAt(index)
                                .productInfo['id'] as int,
                            function: () {
                              setState(() {
                                ProductInfo removedProdcut = ProductDetails
                                    .cartContent.value
                                    .elementAt(index);
                                ProductDetails.cartContent.value
                                    .remove(removedProdcut);
                                ProductsScreen.nOfCartElems.value =
                                    ProductDetails.cartContent.value.length;
                              });
                            },
                          )),
                    ),
        ));
  }
}
