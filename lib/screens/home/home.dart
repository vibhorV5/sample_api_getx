import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/models/products.dart';
import 'package:sample_api/screens/wishlist/controller/wishlist_controller.dart';
import 'package:sample_api/services/photos/photos_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final photosService = Get.put(PhotosService());
  final wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.home_filled,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/wishlist');
                },
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 800,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 700,
                width: 600,
                child: GridView.builder(
                  itemCount: Product.productList.length,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: 80,
                                        // width: 10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(Product
                                              .productList[index].imgUrl
                                              .toString()),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        wishlistController.wishlistItemsList
                                            .add(Product.productList[index]);

                                        print(
                                            'Product added to the wishlist = ${Product.productList[index]}');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    Product.productList[index].title.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.amber,
                            child: Text(
                              Product.productList[index].color.toString(),
                            ),
                          ),
                          Container(
                            // color: Colors.amber,
                            child: Text(
                              Product.productList[index].material.toString(),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            // color: Colors.purple,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    Product.productList[index].size!.length,
                                itemBuilder: (context, indexSizes) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(Product
                                        .productList[index].size![indexSizes]),
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
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
                      child: const Text('Load Posts'),
                      onPressed: () async {
                        Get.toNamed('/posts');
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
                      child: Text('Load Photos'),
                      onPressed: () async {
                        Get.toNamed('/photos');

                        await Get.find<PhotosService>().getPhotos();
                      },
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
