import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/services/wishlist/wishlist_service.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final wishlistService = Get.put(WishlistService());

  @override
  Widget build(BuildContext context) {
    debugPrint('Hello = ${wishlistService.wishlistItemsList}');
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
                return wishlistService.wishlistItemsList.isEmpty
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
                        child: ListView.builder(
                          itemCount: wishlistService.wishlistItemsList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 80,
                                  width: mediaQuery.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      wishlistService
                                          .wishlistItemsList[index].title
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
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
