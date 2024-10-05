import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_list/view/detailpage/page/detailpage.dart';
import 'package:movie_list/view/homepage/page/homepage.dart';

class RouterApp {
  static const String initial = '/';
  static const String detailMoviePage = '/detail_movie_page';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
  ];
}
