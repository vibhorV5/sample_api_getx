import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 850,
              width: 600,
              child: TextButton(
                child: Text('Load Posts'),
                onPressed: () {
                  Get.toNamed('/posts');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
