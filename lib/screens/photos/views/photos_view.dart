import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/services/photos/photos_services.dart';

class PhotosView extends StatefulWidget {
  const PhotosView({super.key});

  @override
  State<PhotosView> createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  final photosService = Get.put(PhotosService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.delete<PhotosService>();
              Get.deleteAll();
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text('Photos loaded using GETX'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                children: [
                  photosService.isLoading.isTrue
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
                                    SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Image.network(
                                        photosService
                                            .photosList[index].thumbnailUrl
                                            .toString(),
                                      ),
                                    ),
                                    SizedBox(
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
