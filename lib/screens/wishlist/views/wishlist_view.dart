import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/screens/wishlist/controller/wishlist_controller.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            // Get.deleteAll();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        title: Text('Wishlist Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                return wishlistController.wishlistItemsList.isEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(20),
                        height: 100,
                        width: mediaQuery.width,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Please add items to your wishlist from Home by tapping',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                      )
                    : Container(
                        margin: EdgeInsets.all(20),
                        height: 780,
                        width: 600,
                        color: Colors.red,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount:
                              wishlistController.wishlistItemsList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        wishlistController
                                            .wishlistItemsList[index].imgUrl
                                            .toString(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          wishlistController
                                              .wishlistItemsList[index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          wishlistController
                                              .wishlistItemsList[index].color
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          wishlistController
                                              .wishlistItemsList[index].material
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          wishlistController
                                              .wishlistItemsList[index]
                                              .size
                                              .first
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
