import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:meta/meta.dart';

class ApiController extends GetxController {
  final ApiRepository repository;
  ApiController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() {
    super.onInit();
  }
}
