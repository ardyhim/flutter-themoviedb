import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';
import 'package:hypemovies/app/data/services/database.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(apiRepository: Get.find()),
    );
    Get.lazyPut<ApiRepository>(() => ApiRepository(provider: Get.find()));
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<DbService>(() => DbService());
  }
}
