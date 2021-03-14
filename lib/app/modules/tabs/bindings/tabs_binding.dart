import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(apiRepository: Get.find()),
    );
    Get.lazyPut<ApiRepository>(() => ApiRepository(provider: Get.find()));
    Get.lazyPut<ApiProvider>(() => ApiProvider());
  }
}
