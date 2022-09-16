import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api/models/posts.dart';

class PostsController extends GetxController {
  RxList postList = <Posts>[].obs;

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  Future<dynamic> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(Posts.fromJson(i));
      }
      return postList;
    } else {
      postList;
    }
    return postList;
  }
}
