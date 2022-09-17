import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sample_api/routes/routes.dart';
import 'package:sample_api/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      title: 'Sample API using GETX',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}
