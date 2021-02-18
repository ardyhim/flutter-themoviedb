import 'package:get/get.dart';

import 'package:hypemovies/app/modules/detail/bindings/detail_binding.dart';
import 'package:hypemovies/app/modules/detail/views/cast_view.dart';
import 'package:hypemovies/app/modules/detail/views/detail_view.dart';
import 'package:hypemovies/app/modules/home/bindings/home_binding.dart';
import 'package:hypemovies/app/modules/home/views/home_view.dart';
import 'package:hypemovies/app/modules/list/bindings/list_binding.dart';
import 'package:hypemovies/app/modules/list/views/list_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.DETAIL;

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
  ];
}
