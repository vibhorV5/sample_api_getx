import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/routes/routes.dart';
import 'package:sample_api/services/products/products_service.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text('Products'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  height: 40,
                  width: 100,
                  child: TextButton(
                    child: const Text('Home'),
                    onPressed: () async {
                      await Get.deleteAll();
                      Get.toNamed(home);
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  height: 40,
                  width: 100,
                  child: TextButton(
                    child: const Text('Wishlist'),
                    onPressed: () async {
                      Get.toNamed(wishlist);
                    },
                  ),
                ),
              ],
            ),
            Obx(
              () {
                return Get.find<ProductsService>().isLoading.isTrue
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            height: 700,
                            width: 600,
                            child: GridView.builder(
                              itemCount: Get.find<ProductsService>()
                                  .productsList
                                  .length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2.1 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.find<ProductsService>()
                                        .wishlistItemsList
                                        .add(Get.find<ProductsService>()
                                            .productsList[index]);

                                    debugPrint('Product added to wishlist');
                                    debugPrint(Get.find<ProductsService>()
                                        .wishlistItemsList[index]
                                        .title);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                Get.find<ProductsService>()
                                                    .productsList[index]
                                                    .title
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          Get.find<ProductsService>()
                                              .productsList[index]
                                              .id
                                              .toString(),
                                        ),
                                        Text(
                                          Get.find<ProductsService>()
                                              .productsList[index]
                                              .id
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
