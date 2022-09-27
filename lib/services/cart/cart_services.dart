import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_api/models/cart_item.dart';

class CartServices extends GetxService {
  final box = GetStorage();

  RxList<CartItem> cartItems = <CartItem>[].obs;

  // var hello = ''.obs;

  // RxBool isLoading = true.obs;

  void addToCart(CartItem cartItem) async {
    cartItems.add(cartItem);
    cartItems.refresh();
    await box.write('cartItemsfromBox', jsonEncode(cartItems));
    // await box.write('cartItemsfromBox', cartItems);
  }

  void decreaseItemQuantity(CartItem cartItem) async {
    if (cartItem.quantity! <= 1) {
      return;
    }
    for (var i = 0; i <= cartItems.length; i++) {
      if (cartItems[i].title == cartItem.title) {
        cartItems[i].quantity = cartItems[i].quantity! - 1;
        cartItems.refresh();
        await box.write('cartItemsfromBox', jsonEncode(cartItems));

        return;
      }
    }
  }

  void increaseItemQuantity(CartItem cartItem) async {
    // if (cartItem.quantity! < 2) {
    //   return;
    // }
    for (var i = 0; i <= cartItems.length; i++) {
      if (cartItems[i].title == cartItem.title) {
        cartItems[i].quantity = cartItems[i].quantity! + 1;
        cartItems.refresh();
        await box.write('cartItemsfromBox', jsonEncode(cartItems));

        return;
      }
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // cartItems.value = box.read('cartItemsfromBox') ?? [];
  //   // hello.value = box.read('cartItemsfromBox') ?? '';
  // }

  void getData() async {
    // isLoading.isTrue;
    var result = await box.read('cartItemsfromBox') ?? '';
    List jsonData = jsonDecode(result);
    cartItems = jsonData.map((item) => CartItem.fromJson(item)).toList().obs;
    // isLoading.isFalse;
    // hello.value = box.read('cartItemsfromBox') ?? '';
  }
}
