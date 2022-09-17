import 'package:get/get.dart';
import 'package:sample_api/screens/home/home.dart';
import 'package:sample_api/screens/photos/views/photos_view.dart';
import 'package:sample_api/screens/posts/views/posts_view.dart';

const String home = '/home';
const String posts = '/posts';
const String photos = '/photos';

class Routes {
  static final routes = [
    GetPage(name: home, page: () => const Home()),
    GetPage(name: posts, page: () => const PostsView()),
    GetPage(name: photos, page: () => const PhotosView()),
  ];
}
