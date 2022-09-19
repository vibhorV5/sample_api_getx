import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api/models/products.dart';

class ProductsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }

  final RxList productsList = <Product>[].obs;

  Future<dynamic> getProducts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in jsonData) {
        productsList.add(Product.fromJson(i));
      }
      return productsList;
    } else {
      productsList;
    }
  }
}
