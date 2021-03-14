import 'package:get/get.dart';

enum Pages {
  Home,
  Users,
}

class ModelPages {
  GetView child;
  Pages name;
  ModelPages({this.child, this.name});
}
