import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
                height: 50,
                width: 100,
                child: TextButton(
                  child: Text('Load Posts'),
                  onPressed: () {
                    Get.toNamed('/posts');
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.black,
                height: 50,
                width: 100,
                child: TextButton(
                  child: Text('Load Photos'),
                  onPressed: () {
                    Get.toNamed('/photos');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
