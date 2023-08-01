import 'package:flutter/material.dart';
import 'package:store_app/view/screens/products/product_details.dart';

class ProductWidget extends StatelessWidget {
  // const Product({Key? key}) : super(key: key);
  final String productName;
  final String hint;
  final double price;
  final String imageUrl;
  final int id;
  // ignore: use_key_in_widget_constructors
  const ProductWidget(
      {required this.productName,
      required this.hint,
      required this.price,
      required this.imageUrl,
      required this.id});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() => Navigator.of(context).pushNamed(
            ProductDetailsScreen.pageRoute,
            arguments: {
              'name': productName,
              'image': imageUrl,
              'hint': hint,
              'price': price,
              'id': id,
            },
          )),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25,
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  child: Image.network(
                    imageUrl,
                    height: screenHeight * .22,
                    width: screenWidth * .3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const Divider(),
              Text(hint),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$price\$',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
