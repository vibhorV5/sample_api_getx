import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api/models/products.dart';

class ProductsService extends GetxService {
  //service

  final RxList<Product> productsList = <Product>[].obs;
  RxList<Product> wishlistItemsList = <Product>[].obs;
  RxBool isLoading = true.obs;

  Future<dynamic> getProducts() async {
    isLoading(true);
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in jsonData) {
        productsList.add(Product.fromJson(i));
        isLoading(false);
      }
      return productsList;
    } else {
      productsList;
    }
  }

  Future<dynamic> getWishlist() async {}

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
}
