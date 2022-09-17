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
  void initState() {
    // TODO: implement initState
    super.initState();
    // photosService.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put<PhotosService>(PhotosService());

    // final photosService = Get.put(PhotosService());

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.reset();
              Get.deleteAll();
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.yellow,
            ),
          ),
          title: Text('Photos loaded using GETX'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                children: [
                  photosService.isLoading == true
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

// void disposeService(BuildContext context) {
//   Get.delete(PhotosService());
// }


