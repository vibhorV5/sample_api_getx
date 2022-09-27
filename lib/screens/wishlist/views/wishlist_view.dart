import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/models/cart_item.dart';
import 'package:sample_api/services/cart/cart_services.dart';
import 'package:sample_api/services/products/products_service.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.deleteAll();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text('Wishlist'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                return Get.find<ProductsService>().wishlistItemsList.isEmpty
                    ? Center(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: const Text(
                            'Please add products to your wishlist',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        height: 780,
                        width: 600,
                        color: Colors.white,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: Get.find<ProductsService>()
                              .wishlistItemsList
                              .length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 100,
                              width: mediaQuery.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Get.find<ProductsService>()
                                        .wishlistItemsList[index]
                                        .title
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          //Item Check
                                          // if (Get.find<CartServices>()
                                          //     .cartItems
                                          //     .contains(CartItem(
                                          //         title: Get.find<
                                          //                 ProductsService>()
                                          //             .wishlistItemsList[index]
                                          //             .title
                                          //             .toString(),
                                          //         quantity: 1))) {
                                          //   return;
                                          // }

                                          Get.find<CartServices>().addToCart(
                                            CartItem(
                                              title: Get.find<ProductsService>()
                                                  .wishlistItemsList[index]
                                                  .title
                                                  .toString(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.white,
                                          child: const Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
