import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/movies_list_model.dart';
import 'package:meta/meta.dart';

class ApiController extends GetxController {
  final ApiRepository repository;
  ApiController({@required this.repository}) : assert(repository != null);

  var moviesLatest = RxList<MoviesList>().obs;
  @override
  void onInit() {
    repository.getLatestMovies().then((value) => {print(value)});
    super.onInit();
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
