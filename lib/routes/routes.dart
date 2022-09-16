import 'package:get/get.dart';
import 'package:sample_api/screens/home/home.dart';
import 'package:sample_api/screens/posts/views/posts_view.dart';

const String home = '/home';

class Routes {
  static final routes = [
    GetPage(name: '/home', page: () => const Home()),
    GetPage(name: '/posts', page: () => PostsView()),
  ];
}
