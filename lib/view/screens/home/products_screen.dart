import 'package:flutter/material.dart';
import 'package:store_app/data/constants/categories.dart';
import 'package:store_app/view/screens/cart/cart_content.dart';
import 'package:store_app/view/widgets/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static const pageRoute = 'products_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffECECEE),
        elevation: 0,
        title: const Text(
          'Store App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.pageRoute);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                color: Colors.black,
                iconSize: 35,
              ),
              //it will be like this if cart products list length == 0 return null
              // else return this container
              Positioned(
                top: 0,
                left: 0,
                child: Center(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '5',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          //text field for looking for products
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 20,
              left: 8,
            ),
            child: Row(
              children: [
                searching(context),
                //for sorting the products
                filtering(context),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return categoryFilter(
                  context,
                  categoryName: category.name,
                  onTap: () {},
                );
              }).toList(),
            ),
          ),
          products(context),
        ],
      ),
    );
  }

  InkWell categoryFilter(
    BuildContext context, {
    required String categoryName,
    required void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Text(
          categoryName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  SizedBox filtering(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .2,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.filter_alt),
      ),
    );
  }

  Expanded searching(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        height: 40,
        child: TextField(
          enabled: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_sharp,
            ),
            label: Text(
              'Search...',
              style: Theme.of(context).inputDecorationTheme.labelStyle,
            ),
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          ),
        ),
      ),
    );
  }

  Expanded products(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          mainAxisExtent: MediaQuery.of(context).size.height / 2,
          childAspectRatio: 7 / 12,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        padding: EdgeInsets.only(
          top: 20,
          right: MediaQuery.of(context).size.width * .04,
          left: MediaQuery.of(context).size.width * .04,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) => const ProductWidget(
          productName: 'name',
          hint: 'hint',
          price: 20,
          imageUrl: 'url',
          id: 2,
        ),
      ),
    );
  }
}
