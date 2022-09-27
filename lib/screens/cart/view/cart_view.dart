import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/services/cart/cart_services.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            // Get.deleteAll();
            // Get.delete<ProductsController>();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text('Cart'),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: 700,
                  width: double.infinity,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          // padding: EdgeInsets.all(10),
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Get.find<CartServices>()
                                    .cartItems[index]
                                    .title
                                    .toString(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.find<CartServices>()
                                          .decreaseItemQuantity(
                                        Get.find<CartServices>()
                                            .cartItems[index],
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    Get.find<CartServices>()
                                        .cartItems[index]
                                        .quantity
                                        .toString(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.find<CartServices>()
                                          .increaseItemQuantity(
                                        Get.find<CartServices>()
                                            .cartItems[index],
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: Get.find<CartServices>().cartItems.length),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
