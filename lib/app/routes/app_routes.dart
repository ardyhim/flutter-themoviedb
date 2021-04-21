part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const LIST = _Paths.LIST;
  static const DETAIL = _Paths.DETAIL;
  static const SEARCH = _Paths.SEARCH;
  static const TABS = _Paths.TABS;
  static const FAVORITE = _Paths.FAVORITE;
  static const LOGIN = _Paths.LOGIN;
  static const USERS = _Paths.USERS;
  static const FAVORITES = _Paths.FAVORITES;
  static const WATCH_LIST = _Paths.WATCH_LIST;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LIST = '/list/:category/:sortBy';
  static const DETAIL = '/detail/:type/:id';
  static const SEARCH = '/search/:keyword';
  static const TABS = '/main';
  static const FAVORITE = '/favorite';
  static const LOGIN = '/login';
  static const USERS = '/users';
  static const FAVORITES = '/favorites/:category/:sortBy';
  static const WATCH_LIST = '/watchlist/:category/:sortBy';
}
