import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/services/photos/photos_services.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    // final PhotosController photosController = Get.put(PhotosController());

    // Get.put<PhotosService>(PhotosService());

    final photosService = Get.put(PhotosService());

    return Scaffold(
        appBar: AppBar(
          title: Text('Photos loaded using GETX'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                children: [
                  photosService.photosList.isEmpty
                      ? Container(
                          height: 750,
                          width: 600,
                          color: Colors.red,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Container(
                          height: 750,
                          width: 600,
                          color: Colors.red,
                          child: ListView.builder(
                              itemCount: photosService.photosList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      child: Image.network(
                                        photosService
                                            .photosList[index].thumbnailUrl
                                            .toString(),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 120,
                                      child: Image.network(
                                        photosService.photosList[index].url
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                ],
              );
            },
          ),
        ));
  }
}
