import 'package:get/get.dart';

import 'package:hypemovies/app/modules/detail/bindings/detail_binding.dart';
import 'package:hypemovies/app/modules/detail/views/detail_view.dart';
import 'package:hypemovies/app/modules/home/bindings/home_binding.dart';
import 'package:hypemovies/app/modules/home/views/home_view.dart';
import 'package:hypemovies/app/modules/list/bindings/list_binding.dart';
import 'package:hypemovies/app/modules/list/views/list_view.dart';
import 'package:hypemovies/app/modules/search/bindings/search_binding.dart';
import 'package:hypemovies/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST,
      page: () => ListView(),
      binding: ListBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
