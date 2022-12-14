import 'package:get/get.dart';
import 'package:sample_api/screens/cart/view/cart_view.dart';
import 'package:sample_api/screens/home/home.dart';
import 'package:sample_api/screens/photos/views/photos_view.dart';
import 'package:sample_api/screens/posts/views/posts_view.dart';
import 'package:sample_api/screens/products/views/products_view.dart';
import 'package:sample_api/screens/wishlist/views/wishlist_view.dart';

const String home = '/home';
const String posts = '/posts';
const String photos = '/photos';
const String wishlist = '/wishlist';
const String products = '/products';
const String cart = '/cart';

class Routes {
  static final routes = [
    GetPage(name: home, page: () => const Home()),
    GetPage(name: posts, page: () => const PostsView()),
    GetPage(name: photos, page: () => const PhotosView()),
    GetPage(name: wishlist, page: () => const WishlistView()),
    GetPage(name: products, page: () => const ProductsView()),
    GetPage(name: cart, page: () => const CartView()),
  ];
}
