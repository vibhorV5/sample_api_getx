import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/screens/products/controller/products_controller.dart';
import 'package:sample_api/screens/wishlist/controller/wishlist_controller.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final wishlistController = Get.put(WishlistController());
  final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Obx(
        () {
          return Container(
            padding: EdgeInsets.all(20),
            height: 800,
            width: 600,
            child: GridView.builder(
              itemCount: productsController.productsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.1 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.amber,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 80,
                                  // width: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      productsController.productsList[index].url
                                          .toString(),
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     wishlistController.wishlistItemsList
                                //         .add(Product.productList[index]);

                                //     print(
                                //         'Product added to the wishlist = ${Product.productList[index]}');
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(10.0),
                                //     child: Icon(
                                //       Icons.favorite,
                                //       size: 35,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                productsController.productsList[index].albumId
                                    .toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        child: Text(
                          productsController.productsList[index].id.toString(),
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        child: Text(
                          productsController.productsList[index].id.toString(),
                        ),
                      ),
                      // Container(
                      //   height: 30,
                      //   width: 100,
                      //   // color: Colors.purple,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: Product.productList[index].size!.length,
                      //       itemBuilder: (context, indexSizes) {
                      //         return Padding(
                      //           padding: const EdgeInsets.only(right: 10),
                      //           child: Text(
                      //               Product.productList[index].size![indexSizes]),
                      //         );
                      //       }),
                      // )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
