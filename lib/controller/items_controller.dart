import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  void initialData();
}

class ItemsControllerImpl extends ItemsController {
  CategoryModel? model;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void initialData() {}
}
