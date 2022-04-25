import 'package:flutter/material.dart';
import 'package:store_app/app_data/product_info.dart';
import 'package:store_app/app_data/products_list.dart';
import 'package:store_app/screens/cart_content.dart';
import 'package:store_app/screens/product_details.dart';
import 'package:store_app/widgets/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> nOfCartElems = ValueNotifier(0);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selected = 1;
  List<ProductInfo> selectedCategory = myProducts.where((element) {
    String category = element.productInfo['category'] as String;
    return category.contains('electronic');
  }).toList();

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
                  Navigator.of(context).pushNamed(Cart.pageRoute);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                color: Colors.black,
                iconSize: 35,
              ),
              //it will be like this if cart products list length == 0 reurn null
              // else return this container
              Positioned(
                top: 0,
                left: 0,
                child: ValueListenableBuilder(
                  valueListenable: ProductsScreen.nOfCartElems,
                  builder: (context, index, _) => Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ProductsScreen.nOfCartElems.value == 0
                            ? null
                            : Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: ProductsScreen.nOfCartElems.value == 0
                          ? null
                          : Center(
                              child: Text(
                                '${ProductDetails.cartContent.value.length}',
                              ),
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
              children: [
                categoryFilter(context, 'electronic', 1, () {
                  setState(() {
                    selected = 1;
                    selectedCategory = myProducts.where((element) {
                      String category =
                          element.productInfo['category'] as String;
                      return category.contains('electronic');
                    }).toList();
                  });
                }),
                categoryFilter(context, 'clothes', 2, () {
                  setState(() {
                    selected = 2;
                    selectedCategory = myProducts.where((element) {
                      //create a variable to hold the category value to easy acces it
                      String category =
                          element.productInfo['category'] as String;
                      return category.contains('clothes');
                    }).toList();
                  });
                }),
                categoryFilter(context, 'home', 3, () {
                  setState(() {
                    selected = 3;
                    selectedCategory = myProducts.where((element) {
                      String category =
                          element.productInfo['category'] as String;
                      return category.contains('home');
                    }).toList();
                  });
                }),
                categoryFilter(context, 'kids', 4, () {
                  setState(() {
                    selected = 4;
                    selectedCategory = [];
                  });
                }),
                categoryFilter(context, 'men', 5, () {
                  setState(() {
                    selected = 5;
                    selectedCategory = [];
                  });
                }),
                categoryFilter(context, 'women', 6, () {
                  setState(() {
                    selected = 6;
                    selectedCategory = [];
                  });
                }),
              ],
            ),
          ),
          products(context),
        ],
      ),
    );
  }

  InkWell categoryFilter(
    BuildContext context,
    String categoryName,
    state,
    function,
  ) {
    return InkWell(
      onTap: function,
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
          color: state == selected ? null : Colors.white,
        ),
        child: Text(
          categoryName,
          style: Theme.of(context).textTheme.headline5,
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
      child: selectedCategory.isEmpty
          ? Center(
              child: Text(
                'not avilable yet',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          : GridView.builder(
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
              itemCount: selectedCategory.length,
              itemBuilder: (context, index) => Product(
                productName: selectedCategory[index].productInfo['productName']
                    as String,
                hint: selectedCategory[index].productInfo['hint'] as String,
                price: selectedCategory[index].productInfo['price'] as double,
                imageUrl:
                    selectedCategory[index].productInfo['imageUrl'] as String,
                id: selectedCategory[index].productInfo['id'] as int,
              ),
            ),
    );
  }
}
