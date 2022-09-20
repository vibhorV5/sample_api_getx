import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/services/photos/photos_services.dart';
import 'package:sample_api/services/products/products_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final productsService = Get.put(ProductsService());
    final photosService = Get.put(PhotosService());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Home')),
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
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
                        //multiple instances of products controller are created
                        Get.toNamed('/products');
                        // Get.put(ProductsController());
                        await Get.find<ProductsService>().getProducts();
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
                        Get.toNamed('/wishlist');
                        // await Get.find<PhotosService>().getPhotos();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
                      child: const Text('Load Photos'),
                      onPressed: () async {
                        Get.toNamed('/photos');
                        // final photosService = Get.put(PhotosService());
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
