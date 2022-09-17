import 'dart:convert';
import 'package:get/get.dart';
import 'package:sample_api/models/photos.dart';
import 'package:http/http.dart' as http;

class PhotosService extends GetxService {
  @override
  void onInit() {
    getPhotos();
    super.onInit();
  }

  RxList photosList = <Photos>[].obs;
  // var photosList = [];

  Future<dynamic> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        photosList.add(Photos.fromJson(i));
      }
      return photosList;
    } else {
      photosList;
    }
    return photosList;
  }
}
