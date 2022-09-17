import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/services/photos/photos_services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final photosService = Get.put(PhotosService());

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
                height: 50,
                width: 100,
                child: TextButton(
                  child: Text('Load Posts'),
                  onPressed: () async {
                    Get.toNamed('/posts');
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.black,
                height: 50,
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
        ),
      ),
    );
  }
}
