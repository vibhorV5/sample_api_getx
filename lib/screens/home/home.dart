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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 55,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         InkWell(
      //           onTap: () {},
      //           child: const Icon(
      //             Icons.home_filled,
      //             color: Colors.black,
      //             size: 40,
      //           ),
      //         ),
      //         InkWell(
      //           onTap: () {
      //             Get.toNamed('/wishlist');
      //           },
      //           child: const Icon(
      //             Icons.favorite_rounded,
      //             color: Colors.black,
      //             size: 40,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 800,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      child: const Text('Products'),
                      onPressed: () async {
                        Get.toNamed('/products');
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
                      child: Text('Wishlist'),
                      onPressed: () async {
                        Get.toNamed('/wishlist');

                        await Get.find<PhotosService>().getPhotos();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
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
